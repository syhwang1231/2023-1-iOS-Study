//
//  FeedAPIInput.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/05/16.
//

struct FeedAPIInput : Encodable{
    // 파라미터 변수 선언
    var limit : Int?
    var page : Int?
    var api_key : String?
}

