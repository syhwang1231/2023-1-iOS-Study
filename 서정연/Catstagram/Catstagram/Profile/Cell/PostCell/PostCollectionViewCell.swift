//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/05/11.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setUpData(){
        // 이미지 뷰의 이미지를 업로드한다
    }
}
