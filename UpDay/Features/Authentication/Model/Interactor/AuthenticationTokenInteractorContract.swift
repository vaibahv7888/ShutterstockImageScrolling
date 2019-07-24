//
//  AuthenticationTokenInteractorContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

protocol AuthenticationTokenInteractorContract {
    func getAuthenticationToken(completion: @escaping (String?)->Void)
    func getAuthenticationTokenFromKeyChain() -> String?
}
