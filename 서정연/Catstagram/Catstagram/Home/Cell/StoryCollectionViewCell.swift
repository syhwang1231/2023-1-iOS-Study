//
//  StoryCollectionViewCell.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/05/03.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewImageViewBackground: UIView!
    
    @IBOutlet weak var viewUserProfileBackground: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23
        imageViewUserProfile.layer.cornerRadius = 22
        // 원만큼 이미지 자름
        imageViewUserProfile.clipsToBounds = true
    }

}
