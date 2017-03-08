//
//  ViewController.swift
//  eShares-iOS-Challenge
//
//  Created by Thiago Orniz Martin on 07/03/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SpotifyDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpotifyManager(delegate: self).startRetrievingData()
    }
    
    // MARK: - SpotifyDelegate
    func dataRetrieved(_ releases:[ReleaseModel]){
        print(releases)
    }
    
}

