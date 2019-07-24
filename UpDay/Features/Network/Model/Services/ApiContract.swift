//
//  ApiContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/15/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

protocol ApiContract {
    func getUrl() -> URL?
    func isAuthenticationRequired() -> Bool
    func getQueryParameters(pageIndex:Int) -> [String:Any]?
    func getHTTPHeaders() -> [String:String]?
}
