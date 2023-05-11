//
//  ProfileCollectionViewCell.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/05/10.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileImageView: UIImageView!
    @IBOutlet weak var profileEditButton: UIButton!
    @IBOutlet weak var addFriendButton: UIButton!
    @IBOutlet weak var postingCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpAttribute()
    }
    
    private func setUpAttribute() {
        addProfileImageView.layer.cornerRadius = 24 / 2
        
        profileImageView.layer.cornerRadius = 88 / 2
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        profileEditButton.layer.cornerRadius = 5
        profileEditButton.layer.borderColor = UIColor.lightGray.cgColor
        profileEditButton.layer.borderWidth = 1
        
        addFriendButton.layer.cornerRadius = 3
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        [postingCount, followerCount, followingCount].forEach{ $0.text = "\(Int.random(in: 0...300))"}
    }

}
