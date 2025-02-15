//
//  FeedUploadDataManager.swift
//  Catstagram
//
//  Created by 정나윤 on 2023/05/17.
//

import Alamofire

class FeedUploadDataManager {
    func posts(_ viewController : HomeViewController, _ parameter: FeedUploadInput) {
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeedUploadModel.self) { response in
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("성공")
                } else {
                    print(result.message)
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}
