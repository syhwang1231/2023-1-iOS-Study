//
//  PostCollectionViewCell.swift
//  instagram
//
//  Created by 장나리 on 2023/05/10.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {

    static let identifier = "PostCollectionViewCell"
    
    
    @IBOutlet weak var postImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    public func setupData(){
        //이미지뷰의 이미지를 업로드 한다.
    }
}
