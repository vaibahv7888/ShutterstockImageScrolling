//
//  ApiEndPoint.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

enum ApiEndPoint : String, Equatable {
    case baseUrl
    case imageSearch
    case fetchToken
    
    var apiPListFileName : String {
        switch self {
        case .baseUrl:
            return "ApiEndPoints"
        case .fetchToken:
            return "ApiEndPoints"
        case .imageSearch:
            return "ApiEndPoints"
        }
    }
    
    var apiEndpointKey : String {
        switch self {
        case .baseUrl:
            return ApiEndPoint.baseUrl.rawValue
        case .fetchToken:
            return ApiEndPoint.fetchToken.rawValue
        case .imageSearch:
            return ApiEndPoint.imageSearch.rawValue
        }
    }
    
}


