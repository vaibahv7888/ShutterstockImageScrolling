//
//  AccessToken.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

public struct AccessToken : Codable {
    let access_token : String
    let token_type : String
}

public struct TokenMessage : Codable {
    let message : String
}
