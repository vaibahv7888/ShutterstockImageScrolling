//
//  AuthenticationTokenApi.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit
import Alamofire

struct AuthenticationTokenApi : ApiContract {
    let apiService : ApiServiceContract!
    let apiEndPointProvider : ApiEndPointProviderContract!
    let readPListFile : ReadPListFileContract!
    
    private var authenticationCredentialsDictionary : [String:String]?
    
    init(apiService : ApiServiceContract, apiEndPointProvider : ApiEndPointProviderContract, readPListFile : ReadPListFileContract) {
        self.apiService = apiService
        self.apiEndPointProvider = apiEndPointProvider
        self.readPListFile = readPListFile
        self.authenticationCredentialsDictionary = self.readPListFile.readPListFile(for: "AuthenticationCredentials")
    }
    
    func getUrl() -> URL? {
        guard let url = self.apiEndPointProvider.apiUrl(.fetchToken) else { return nil }
        return url
    }
    
    func isAuthenticationRequired() -> Bool {
        return false
    }
    
    func getQueryParameters(pageIndex: Int = 0) -> [String : Any]? {
        guard let credentialsDictionary = self.authenticationCredentialsDictionary else { return nil }
        
        return ["client_id" : credentialsDictionary[AuthenticationCredentialsEndPoint.consumerKey.endPointKey] ?? "",
                "client_secret" : credentialsDictionary[AuthenticationCredentialsEndPoint.consumerSecret.endPointKey] ?? "",
                "code" : credentialsDictionary[AuthenticationCredentialsEndPoint.code.endPointKey] ?? "",
                "grant_type" : "authorization_code",
                "realm":"customer"]
    }
    
    func getHTTPHeaders() -> [String : String]? {
        return nil
    }
}

extension AuthenticationTokenApi : AuthenticationTokenApiContract {
    func fetchAuthenticationToken(completion: @escaping (Data?) -> Void) {
        print("self.getUrl() = \(String(describing: self.getUrl()))")
        print("getQueryParameters() = \(String(describing: self.getQueryParameters()))")
        print("getHTTPHeaders() = \(String(describing: self.getHTTPHeaders()))")
        self.apiService.post(self.getUrl(), authenticationRequired: self.isAuthenticationRequired(), queryParameters: self.getQueryParameters(), httpHeaders: self.getHTTPHeaders()) { (response) in
            guard let responseData = response else {
                completion(nil)
                return
            }
            print(responseData)
            completion(responseData)
        }
    }
    
}
