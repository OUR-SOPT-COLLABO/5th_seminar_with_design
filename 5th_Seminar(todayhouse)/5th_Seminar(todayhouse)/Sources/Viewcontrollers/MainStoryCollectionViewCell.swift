//
//  MainStoryCollectionViewCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by 김지현 on 2020/06/11.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

struct StoryData {
    var storyImage: UIImage?
    //var imageNum: String
    init(imageName: String) {
        self.storyImage = UIImage(named: imageName)
    }
}

class MainStoryCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "StoryCell"
    
    @IBOutlet weak var storyImageView: UIImageView!
    
    func storySet(_ storyInformation: StoryData) {
        storyImageView.image = storyInformation.storyImage
    }
}
