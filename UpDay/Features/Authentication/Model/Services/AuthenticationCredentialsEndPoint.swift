//
//  AuthenticationCredentialsEndPoint.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

enum AuthenticationCredentialsEndPoint : String {
    case consumerKey
    case consumerSecret
    case code
    
    var endPointKey : String {
        return self.rawValue
    }
}
