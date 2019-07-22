//
//  FetchAuthenticateTokenContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/21/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

protocol FetchAuthenticateTokenContract {
    func fetchAuthenticateToken(completion: @escaping (String?)->Void)
}
