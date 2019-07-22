//
//  ImageCacheContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/19/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol ImageCacheContract {
    func cacheImage(_ image: UIImage, for url:String)
    func getCachedImage(for url:String) -> UIImage?
}
