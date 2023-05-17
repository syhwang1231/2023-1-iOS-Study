//
//  ProfileViewController.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/05/10.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var userPosts : [GetUserPosts]?{
        // 데이터 전달 해준 다음에 UI 만들도록
        didSet{self.profileCollectionView.reloadData()}
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        
        /* TEST */
        UserFeedDataManager().getUserFeed(self)
        
        // 네트워크 통신
        setUpData()
        
    }
    
    // MARK: -Properties
    
    // MARK: -Helpers
    private func setUpCollectionView(){
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        // cell 등록
        profileCollectionView.register(
            UINib(nibName: "ProfileCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
        profileCollectionView.register(
            UINib(nibName: "PostCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    }
    
    // 데이터 가져옴
    private func setUpData(){
        UserFeedDataManager().getUserFeed(self)
    }

}

// MARK: - 프로토콜 채택(UICollectionViewDelegate, UICollectionViewDataSource)
extension ProfileViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    // section 개수 설정
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // cell 개수 -> 프로필 / 피드에 따라 다르게 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 데이터 개수만큼 지정
        switch section{
        case 0:
            return 1
        default:
            return userPosts?.count ?? 0
        }
    }
    
    // Cell 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell else{
                // return UICollectionViewCell()
                fatalError("셀 타입캐스팅 실패")
            }
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as? PostCollectionViewCell else{
                // return UICollectionViewCell()
                fatalError("셀 타입캐스팅 실패")
            }
            
            // cell.setUpData() <-- 데이터 전달
            let itemIndex = indexPath.item
            if let cellData = self.userPosts{
                // 데이터가 있는 경우 cell에 데이터 전달
                cell.setUpData(cellData[itemIndex].postImgUrl)
            }
            return cell
            
        }
        
    
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section{
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(159))
        default:
            // post 하나의 길이
            let side = CGFloat((collectionView.frame.width - 4) / 3) // 중간 여백 제외
            return CGSize(width: side, height: side)
            
        }
    }
    
    // post간의 좌/우 간격 설정 (열간 간격)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
            
        }
    }
    // post 간의 위/아래 간격 설정(행간 간격)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
            
        }
    }
    
}

// 호출 성공시의 메소드 : API 통신 메소드
extension ProfileViewController {
    func successFeedAPI(_ result : UserFeedModel){
        
        self.userPosts = result.result?.getUserPosts // 받아온 데이터 전달
    }
}
