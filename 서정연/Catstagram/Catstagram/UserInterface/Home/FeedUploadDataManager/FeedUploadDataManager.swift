//
//  FeedUploadDataManager.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/05/17.
//

import Alamofire

class FeedUploadDataManager{
    func posts(_ viewController : HomeViewController, _ parameters : FeedUploadInput){
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: nil)
            .validate()
            .responseDecodable(of: FeedUploadModel.self) { responce in
                switch responce.result{
                case .success(let result):
                    if result.isSuccess {
                        print("성공")
                    }else{
                        print(result.message)
                    }
                case .failure(let err): // 서버 자체와의 연동 끝
                    print(err.localizedDescription)
                }
            }
    }
    
}


