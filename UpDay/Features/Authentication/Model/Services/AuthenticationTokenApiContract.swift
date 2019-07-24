//
//  AuthenticationTokenApiContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

protocol AuthenticationTokenApiContract {
    func fetchAuthenticationToken(completion: @escaping (Data?)->Void)
}
