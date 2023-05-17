//
//  FeedUploadModel.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/05/17.
//

struct FeedUploadModel : Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult
}

struct FeedUploadResult : Decodable{
    var postIdx: Int?
}
