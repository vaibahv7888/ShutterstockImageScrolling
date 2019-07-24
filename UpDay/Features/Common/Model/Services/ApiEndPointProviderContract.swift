//
//  ApiEndPointProviderContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

protocol ApiEndPointProviderContract {
    func apiUrl(_ apiEndpoint: ApiEndPoint) -> URL?
}
