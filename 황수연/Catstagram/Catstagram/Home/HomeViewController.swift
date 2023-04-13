//
//  HomeViewController.swift
//  Catstagram
//
//  Created by Suyeon Hwang on 2023/04/09.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // tableView의 프로토콜?을 위임받았다고 선언해줘야 함. dataSource도 마찬가지
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none  // cell 간 구분선 스타일
        
        // nib은 FeedTableViewCell << 이 파일임
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")  // tableview에 이 cell을 등록
        
        // story도 똑같이 nib으로 등록
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    // 한 섹션에 몇 개의 셀을 넣을지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // test
        return 10
    }
    
    // 어떤 셀을 보여줄지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 첫번째 cell에는 story 컬렉션 뷰를 넣고
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else{
                return UITableViewCell()
            }
            return cell
        }
        // 아닐 경우 feed 테이블 셀을 넣을 것
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    // 현재는 cell의 높이가 고정되어 있기 때문에 제대로 안 보임 -> height 다시 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 스토리 테이블뷰 셀의 높이
        if indexPath.row == 0 {
            return 80
        }
        // 피드 테이블뷰 셀의 높이
        else{
            return 600
        } 
    }
    
    // 이 cell이 보여질 때 어떻게 할지
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else{
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

// collectionview 때는 UICollectionViewDelegateFlowLayout을 항상 추가해줘야 함
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // 몇 개의 cell로 이루어지게 할건지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // 어떤 cell로 이루어졌는지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
    
}
