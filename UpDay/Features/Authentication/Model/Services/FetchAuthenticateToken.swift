//
//  FetchAuthenticateToken.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct FetchAuthenticateToken : FetchAuthenticateTokenContract {
    let authenticationTokenApi : AuthenticationTokenApiContract!
    let decoder : JSONDecoderContract!
    let constantToken : GetConstantTokenContract!
    
    init(authenticationTokenApi : AuthenticationTokenApiContract, decoder : JSONDecoderContract, constantToken : GetConstantTokenContract) {
        self.authenticationTokenApi = authenticationTokenApi
        self.decoder = decoder
        self.constantToken = constantToken
    }
    
    func fetchAuthenticateToken(completion: @escaping (AccessToken?) -> Void) {
        self.authenticationTokenApi.fetchAuthenticationToken { (response) in
            if let accessToken  = self.decoder.decodeJSON(type: AccessToken.self, from: response) {
                print(accessToken)
                completion(accessToken)
                return
            }
            if let tokenMessage = self.decoder.decodeJSON(type: TokenMessage.self, from: response) {
                print(tokenMessage)
                completion(nil)
            }
            self.constantToken.getConstantToken(completion: { (response) in
                completion(response)
            })
        }
    }
}
