//
//  FetchImageRepositoryContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/19/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol FetchImageInteractorContract {
    func fetchImage(for url:String, completion: @escaping (UIImage?)->Void) -> ImageRequest?
}
