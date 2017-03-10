//
//  SpotifyDelegate.swift
//  eShares-iOS-Challenge
//
//  Created by Thiago Orniz Martin on 07/03/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

protocol SpotifyDelegate {
    func dataRetrieved(_ releases:[ReleaseModel])
    func spotifyRequestDidFail()
}
