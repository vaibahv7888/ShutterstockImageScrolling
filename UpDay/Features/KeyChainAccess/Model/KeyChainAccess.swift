//
//  KeyChainAccess.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import SwiftKeychainWrapper

struct KeyChainAccess : KeyChainAccessContract {
    func set(value: String, forKey key: String) {
        KeychainWrapper.standard.set(value, forKey: key)
    }
    
    func getString(forKey key: String) -> String? {
        return KeychainWrapper.standard.string(forKey: key)
    }
}
