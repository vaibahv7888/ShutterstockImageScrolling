//
//  FetchPicturesApi.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/15/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct FetchPicturesApi : ApiContract {
    let apiService : ApiServiceContract!
    let apiEndPointProvider : ApiEndPointProviderContract!
    let authenticationTokenInteractor : AuthenticationTokenInteractorContract!
    
    init(apiService : ApiServiceContract, apiEndPointProvider : ApiEndPointProviderContract, authenticationTokenInteractor : AuthenticationTokenInteractorContract) {
        self.apiService = apiService
        self.apiEndPointProvider = apiEndPointProvider
        self.authenticationTokenInteractor = authenticationTokenInteractor
    }
    
    func getUrl() -> URL? {
        guard let url = apiEndPointProvider.apiUrl(.imageSearch) else { return nil }
        return url
    }
    
    func isAuthenticationRequired() -> Bool {
        return true
    }
    
    func getQueryParameters(pageIndex:Int = 1) -> [String : Any]? {
        return [
            "page" : "\(pageIndex)"
        ]
    }
    
    func getHTTPHeaders() -> [String : String]? {
        return [
            "Accept":"application/json",
            "Authorization" : "Bearer \(self.getAccessToken())",
        ]
    }
    
    private func getAccessToken () -> String {
        guard let token = self.authenticationTokenInteractor.getAuthenticationTokenFromKeyChain() else { return "" }
        return token
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
