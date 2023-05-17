//
//  HomeViewController.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/05/01.
//

import UIKit

// Kingfisher 임포트
import Kingfisher

class HomeViewController: UIViewController{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // 하나의 섹션에 몇개의 cell
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // 어떤 cell 보여줄 것인가
//    }
    // 코드가 길어지면 가독성 떨어짐 -> extension 사용
    

    @IBOutlet weak var tableView: UITableView!
    
    
    // Cat 사진 배열 선언
    var catArray : [FeedModel] = []
     
    // 카메라 혹은 앨범의 view controller
    let imagePickerViewController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        // 구분선 제거
        tableView.separatorStyle = .none
        
        // table view 등록
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        // collection view 등록
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
        
        // API
        let input = FeedAPIInput(limit: 5, page: 0, api_key:"live_Dg3jt2SwxaIjtMVPEFGv18EXEppDgcjlMBfJJhXmDyKFN7KA8XkmHZs49Kb8xLnx")
        FeedDataManager().FeedDataManager(input, self)
        
        
        // extension 후 delegate 설정
        imagePickerViewController.delegate = self
        
    }
    
    // post -> 앨범 이동 action
    @IBAction func buttonDoAlbum(_ sender: Any) {
        // 앨범 선택 후 띄우기 : present()
        self.imagePickerViewController.sourceType = .photoLibrary
        self.present(imagePickerViewController, animated: true, completion: nil)
    }
    
}



extension HomeViewController : UITableViewDelegate, UITableViewDataSource{    // 여기서 함수 정의
    // 여기서 함수 정의
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // 하나의 섹션에 몇개의 cell : 첫번째는 스토리 셀이기 때문에 피드 셀 개수 + 1
        return catArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 첫번째 cell -> storyTable 보여줌
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else{
                return UITableViewCell()
            }
            return cell
        }else{
            // 어떤 cell 보여줄 것인가
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{
            return UITableViewCell()
            }
            
            // 받아온 서버의 사진을 넣어줌
            // url은 String인데..? UIImage에 맞게 cashing
            if let urlString = catArray[indexPath.row - 1].url {// url 가져오기(스토리 셀 제외), .url : array의 값 넣어주기
                let url = URL(string: urlString)
                cell.imageViewFeed.kf.setImage(with: url)
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 첫번째 cell(스토리)는 제외하고
        if indexPath.row == 0{
            return 80
        }else{
            return 600
        }
    }
    
    // cell이 보여졌을 때 바로 collectionview 설정
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else {
            return
        }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 오류 발생
//        let cell = UICollectionViewCell()
//        cell.backgroundColor = .black
//        return cell
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
    
}

extension HomeViewController{
    // 서버 연동 성공
    func successAPI(_ result : [FeedModel]){
        catArray = result
        // viewidload 이후에 다시 tableview reload
        tableView.reloadData()
    }
}

// 선택한 사진 가져오기
extension HomeViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // image picking 했을 때 실행하는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            let imgString = "gs://catstagram-f7dbd.appspot.com/cat1.jpg"
            let input = FeedUploadInput(content: "저희 고양이", postImgsUrl: [imgString])
            FeedUploadDataManager().posts(self, input)
            
            // 성공 시 dismiss
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
