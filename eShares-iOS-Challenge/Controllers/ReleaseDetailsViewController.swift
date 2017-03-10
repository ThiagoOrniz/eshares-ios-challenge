//
//  ReleaseDetailsViewController.swift
//  eShares-iOS-Challenge
//
//  Created by Thiago Orniz Martin on 09/03/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class ReleaseDetailsViewController: UIViewController
{

    @IBOutlet weak var releaseImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var openSpotifyButton: UIButton!
    
    private var release: ReleaseModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        openSpotifyButton.layer.cornerRadius = 20
        populateView()
    }
    
    func setRelease(_ release: ReleaseModel) {
        self.release = release
    }
    
    private func populateView() {
        
        nameLabel.text = release?.name ?? "Unknown"
        artistLabel.text = release?.artistName ?? "Unknown"
        
        if let image = release?.image {
            releaseImageView.fetchImage(forPath: image)
        }
    }
    
    @IBAction func openSpotifyButtonTouched() {
        
        if let url = URL(string: release?.url ?? "" ) {
            
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
                
            } else {
                print("can't open url")
            }
            
        } else {
            print("problem url")
        }
    }
    
}
