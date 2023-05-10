//
//  ProfileViewController.swift
//  instagram
//
//  Created by 장나리 on 2023/05/09.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    //MARK: - Actions
    
    //MARK: - Helpers
    private func setupCollectionView(){
        //delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        //cell 등록
        profileCollectionView.register(UINib(
            nibName: "ProfileCollectionViewCell",
            bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
        profileCollectionView.register(UINib(
            nibName: "PostCollectionViewCell",
            bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    }
}

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //cell의 개수
        switch section {
        case 0:
            return 1
        default:
            return 24
        }
    }
    //cell 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section {
        case 0: // Profile
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else{
    //            return UICollectionViewCell()
                fatalError("셀 타입 캐스팅 실패")
            }
            return cell
        default: // Post
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else{
    //            return UICollectionViewCell()
                fatalError("셀 타입 캐스팅 실패")
            }
//            cell.setupData() // <- 데이터 전달
            return cell
        }
        
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 159)
        default:
            let side = CGFloat((collectionView.frame.width/3)-(4/3))
            return CGSize(width: side, height: side)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { //아이템간(열간) spacing
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { // 행간 spacing
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}
