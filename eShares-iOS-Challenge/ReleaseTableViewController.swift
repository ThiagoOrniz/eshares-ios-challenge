//
//  ViewController.swift
//  eShares-iOS-Challenge
//
//  Created by Thiago Orniz Martin on 07/03/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class ReleaseTableViewController: UITableViewController, SpotifyDelegate {

    var releases: [ReleaseModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpotifyManager(delegate: self).startRetrievingData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return releases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ReleaseTableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReleaseTableViewCell", for: indexPath) as! ReleaseTableViewCell
        
        let release = releases[indexPath.row]
        
        return cell
    }

    
    
    // MARK: - SpotifyDelegate
    func dataRetrieved(_ releases:[ReleaseModel]){
        print(releases)
    }
    
}

