//
//  ImageCache.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/19/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation
import AlamofireImage

extension UInt64 {
    func megabytes() -> UInt64 {
        return self * 1024 * 1024
    }
}

struct ImageCache : ImageCacheContract {
    private let imageCache = AutoPurgingImageCache(
        memoryCapacity: UInt64(100).megabytes(),
        preferredMemoryUsageAfterPurge: UInt64(60).megabytes()
    )
    
    func cacheImage(_ image: UIImage, for url: String) {
        imageCache.add(image, withIdentifier: url)
    }
    
    func getCachedImage(for url: String) -> UIImage? {
        return imageCache.image(withIdentifier: url)
    }
}
