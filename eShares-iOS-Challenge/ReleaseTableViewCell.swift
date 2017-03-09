//
//  ReleaseTableViewCell.swift
//  eShares-iOS-Challenge
//
//  Created by Thiago Orniz Martin on 09/03/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class ReleaseTableViewCell: UITableViewCell
{

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    func populateView(_ release:ReleaseModel){
        
        nameLabel.text = release.name ?? "Unknown"
        artistLabel.text = release.artistName ?? "Unknown"
        //todo image
    }

}
