//
//  PicturesList.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/15/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

public struct PicturesList : Codable {
    let page : Int
    let per_page : Int
    let total_count : Int64
    let search_id : String
    let data : [PictureData]
}

public struct PictureData : Codable {
    let id : String
    let aspect : Double
    let contributor : Contributor
    let assets : Assets
    let description : String
    let image_type : String
    let has_model_release : Bool
    let media_type : String
}

public struct Contributor : Codable {
    let id : String
}

public struct Assets : Codable {
    let preview : Asset
    let small_thumb : Asset
    let large_thumb : Asset
    let huge_thumb : Asset
    let preview_1000 : Asset
    let preview_1500 : Asset
}

public struct Asset : Codable {
    let height : Int
    let url : String
    let width : Int
}
