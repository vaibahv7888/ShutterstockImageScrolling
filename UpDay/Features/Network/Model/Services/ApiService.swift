//
//  ApiService.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/14/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation
import Alamofire

typealias ImageRequest = Request

struct ApiService : ApiServiceContract {
    private let token = "v2/ZTFlZDUtNjFmYjMtOWExNDUtMmRiZTEtY2Y2ZWQtNTFhNjcvMjM5MTY3ODIxL2N1c3RvbWVyLzMvcjJsenQwSVhFazJ2eFZKMEo1T2Z3T2FLbXA5UUVQZnpWVGtrb0hEWmI3eGpxbVZKUzdSUmpxOWJXZ0tzd1VyYlkwdWhMakNMcnlwd2h2MTl4Z2pwekJvbnAtTHU4Z2VORE8yVHVlQWs2SlQyN0JyNGZKbHJrVnAxeE5VMG9pUnBBam5xQTdSQ3QxbnhqMGRLT3RkWHRPZDN3c3lNRndyVkJPZVFuMUowaWZqbkhDTGVtQzd0a2RQSF9HU0xjWjhLZExCVFhBNjZ6MjdrbWpYV09jSVJNdw"

    func get(_ apiUrl: URL?, authenticationRequired: Bool, queryParameters: [String : Any]?, httpHeaders: [String : String]?, completion: @escaping (Data?) -> Void) {
        self.exicuteApi(apiUrl, method: .get, queryParameters: queryParameters, httpHeaders: httpHeaders, Completion: { response in
            if let responseData = response {
                completion(responseData)
                return
            }
            completion(nil)
            })
    }
    
    func post(_ apiUrl: URL?, authenticationRequired: Bool, queryParameters: [String : Any]?, httpHeaders: [String : String]?, completion: @escaping (Data?) -> Void) {
        self.exicuteApi(apiUrl, method: .post, queryParameters: queryParameters, httpHeaders: httpHeaders, Completion: { response in
            if let responseData = response {
                completion(responseData)
                return
            }
            completion(nil)
        })

    }
    
    private func exicuteApi (_ apiUrl:URL?,
                             authenticationRequired:Bool = true,
                             method: HTTPMethod = .get,
                             queryParameters: [String: Any]?,
                             httpHeaders: [String: String]?,
                             Completion: @escaping (_ response:Data?) ->Void
        ) {
        guard let url = apiUrl else {
            Completion(nil)
            return
        }
        
        Alamofire.request(url, method: method, parameters: queryParameters, headers: httpHeaders)
            .validate()
            .response { response in
                guard let data = response.data else {
                    Completion(nil)
                    return
                }
                Completion(data)
        }
    }
    
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) -> ImageRequest? {
        return Alamofire.request(url, method: .get).responseImage { response in
            guard let image = response.result.value else { return }
            completion(image)
        }
    }
}

extension ApiService {
    private func sessionManager (_ isAuthenticationRequired : Bool) -> SessionManager {
        if isAuthenticationRequired {
            return authenticatedSession
        } else {
            return Alamofire.SessionManager.default
        }
    }
    
    private var authenticatedSession: SessionManager {
        get {
            var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
            defaultHeaders["Authorization"] = "Bearer \(token)"
            
            let configuration = URLSessionConfiguration.default
            configuration.httpAdditionalHeaders = defaultHeaders
            configuration.httpAdditionalHeaders = defaultHeaders
            let sessionManager = Alamofire.SessionManager(configuration: configuration)
            return sessionManager
        }
    }
}
