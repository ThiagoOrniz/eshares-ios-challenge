//
//  ReleaseModel.swift
//  eShares-iOS-Challenge
//
//  Created by Thiago Orniz Martin on 07/03/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

struct ReleaseModel
{
    var name: String?
    var artistName: String?
    var thumbnail: String?
    var image: String?
    var url: String?
    
    init(_ name: String?, _ artistName: String?, _ thumbnail: String?, _ image: String?, _ url: String?)
    {
        self.name = name
        self.artistName = artistName
        self.thumbnail = thumbnail
        self.image = image
        self.url = url
    }
    
}
