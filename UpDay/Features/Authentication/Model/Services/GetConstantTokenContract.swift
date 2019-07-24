//
//  GetConstantTokenContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/24/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

protocol GetConstantTokenContract {
    func getConstantToken(completion:@escaping (AccessToken?)->Void)
}
