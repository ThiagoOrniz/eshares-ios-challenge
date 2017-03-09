//
//  SpotifyManager.swift
//  eShares-iOS-Challenge
//
//  Created by Thiago Orniz Martin on 07/03/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SpotifyManager {
    
    private var delegate: SpotifyDelegate?
    
    // The field must have the format: Authorization: Basic <base64 encoded client_id:client_secret>
    // Config file has two Strings clientID and clientSecret
    
    private lazy var auth: String = {
        return String(format: "%@:%@", Config.clientID, Config.clientSecret)
    }()
    
    init(delegate: SpotifyDelegate) {
        self.delegate = delegate
    }
    
    func startRetrievingData() {
        getSpotifyAuth()
    }
    
    private func getSpotifyAuth()
    {
        if let data = auth.data(using: .utf8) {
            
            let base = data.base64EncodedString()
            
            Alamofire.request("https://accounts.spotify.com/api/token",
                              method: .post,
                              parameters: ["grant_type" : "client_credentials"],
                              headers: ["Authorization" : "Basic \(base)"])
                
                .responseJSON {(response:DataResponse<Any>) in
                    
                    switch(response.result) {
                    case .success(let value):
                        print(value)
                        
                        if let result = response.result.value {
                            let token = result as! NSDictionary
                            self.getReleases(token["access_token"] as! String)
                        }
                        break
                        
                    case .failure(let error):
                        print(error)
                        break
                    }
            }
            
        } else {
            print("error to convert auth string to data")
        }
        
    }
    
    private func getReleases(_ token: String)
    {
        Alamofire.request("https://api.spotify.com/v1/browse/new-releases?country=US",
                          headers: ["Authorization" : "Bearer \(token)"])
            .responseJSON { (response: DataResponse<Any>) in
                
                switch response.result {
                    
                    case .success(let value):
                        let json = JSON(value)
                        self.delegate?.dataRetrieved(self.convertJson(json))
                    
                    case .failure(let error):
                        print(error)
                }
        }
    }
    
    private func convertJson(_ json: JSON) -> [ReleaseModel]
    {
        var releases: [ReleaseModel] = []

        for (_, item):(String,JSON) in json["albums"]["items"] {
            
            let name = item["name"].string
            let artistsName = retrieveArtists(item["artists"])
            
            var thumbnail: String?
            var fullImage: String?

            if let images = item["images"].array {
                
                thumbnail = images[2]["url"].string
                fullImage = images[0]["url"].string
            }
            
            let url: String? = item["external_urls"]["spotify"].string
            
            let release = ReleaseModel(name,
                                    artistsName,
                                    thumbnail,
                                    fullImage,
                                    url
            )
            
            releases.append(release)
        }
        return releases
    }
    
    private func retrieveArtists(_ artists:JSON) -> String?
    {
        var artistsName: String?
        
        for (_,artist):(String, JSON) in artists {
            
            if let name = artist["name"].string {
                if artistsName == nil {
                    artistsName = name
                } else {
                    artistsName = artistsName?.appending(" & \(name)")
                }
            }
        }
        
        return artistsName
    }
    
    
}//end of spotifyManager
