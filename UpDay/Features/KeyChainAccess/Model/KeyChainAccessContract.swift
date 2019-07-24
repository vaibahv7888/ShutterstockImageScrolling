//
//  KeyChainAccessContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

protocol KeyChainAccessContract {
    func set(value:String, forKey key:String)
    func getString(forKey key:String) -> String?
}


