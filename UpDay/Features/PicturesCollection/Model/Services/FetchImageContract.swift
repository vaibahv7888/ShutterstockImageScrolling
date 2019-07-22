//
//  FetchImageContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/18/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol FetchImageContract {
    func fetchImage(url: String, completion: @escaping (UIImage?)-> Void) -> ImageRequest?
}
