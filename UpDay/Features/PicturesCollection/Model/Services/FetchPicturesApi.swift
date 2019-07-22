//
//  FetchPicturesApi.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/15/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct FetchPicturesApi : ApiContract {
    
    var apiService : ApiServiceContract!
    
    init(apiService : ApiServiceContract) {
        self.apiService = apiService
    }
    
    var path: String {
        return "https://api.shutterstock.com/v2/images/search?"
    }
    
    func getUrl() -> URL? {
        guard let url = URL(string: self.path) else { return nil }
        return url
    }
    
    func isAuthenticationRequired() -> Bool {
        return true
    }
    
    func getQueryParameters(pageIndex:Int = 1) -> [String : Any]? {
        return [
            "page" : "\(pageIndex)"
//            "query" : "New York",
//            "sort" : "popular",
//            "orientation" : "horizontal"
        ]
    }
    
    func getHTTPHeaders() -> [String : String]? {
        return [
            "Accept":"application/json",
            "Authorization":"Bearer v2/ZTFlZDUtNjFmYjMtOWExNDUtMmRiZTEtY2Y2ZWQtNTFhNjcvMjM5MTY3ODIxL2N1c3RvbWVyLzMvcjJsenQwSVhFazJ2eFZKMEo1T2Z3T2FLbXA5UUVQZnpWVGtrb0hEWmI3eGpxbVZKUzdSUmpxOWJXZ0tzd1VyYlkwdWhMakNMcnlwd2h2MTl4Z2pwekJvbnAtTHU4Z2VORE8yVHVlQWs2SlQyN0JyNGZKbHJrVnAxeE5VMG9pUnBBam5xQTdSQ3QxbnhqMGRLT3RkWHRPZDN3c3lNRndyVkJPZVFuMUowaWZqbkhDTGVtQzd0a2RQSF9HU0xjWjhLZExCVFhBNjZ6MjdrbWpYV09jSVJNdw"
        ]
    }
}

extension FetchPicturesApi : FetchPicturesApiContract {
    func fetchPictures(pageIndex:Int = 1, completion: @escaping (Data?) -> Void) {
        self.apiService.get(self.getUrl(), authenticationRequired: self.isAuthenticationRequired(), queryParameters: self.getQueryParameters(pageIndex: pageIndex), httpHeaders: self.getHTTPHeaders()) { (response) in
            guard let responseData = response else {
                completion(nil)
                return
            }
            completion(responseData)
        }
    }
}
