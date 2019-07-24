//
//  AuthenticationTokenInteractor.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

struct AuthenticationTokenInteractor : AuthenticationTokenInteractorContract {
    
    let fetchAuthenticationToken : FetchAuthenticateTokenContract!
    let keychainAccess : KeyChainAccessContract!
    
    init(fetchAuthenticationToken : FetchAuthenticateTokenContract, keychainAccess : KeyChainAccessContract) {
        self.fetchAuthenticationToken = fetchAuthenticationToken
        self.keychainAccess = keychainAccess
    }
    
    func getAuthenticationToken(completion: @escaping (String?) -> Void) {
        if let accessToken = self.getAuthenticationTokenFromKeyChain() {
            completion(accessToken)
            return
        }
        self.fetchAuthenticationToken.fetchAuthenticateToken { (response) in
            guard let accessToken = response else {
                completion(nil)
                return
            }
            completion(accessToken.access_token)
            self.keychainAccess.set(value: accessToken.access_token, forKey: "access_token")
        }
    }
    
    func getAuthenticationTokenFromKeyChain() -> String? {
        guard let accessToken = self.keychainAccess.getString(forKey: "access_token") else { return nil }
        return accessToken
    }
}
