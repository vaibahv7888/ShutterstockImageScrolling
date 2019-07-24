//
//  FetchImageRepository.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/19/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

struct FetchImageInteractor : FetchImageInteractorContract {
    let fetchImage : FetchImageContract!
    let imageCache : ImageCacheContract!
    
    init(fetchImage:FetchImageContract, imageCache:ImageCacheContract) {
        self.fetchImage = fetchImage
        self.imageCache = imageCache
    }
    
    func fetchImage(for url: String, completion: @escaping (UIImage?) -> Void) -> ImageRequest? {
        if let image = imageCache.getCachedImage(for: url) {
            completion(image)
            return nil
        }
        return self.fetchImage.fetchImage(url: url) { (response) in
            guard let image = response else {
                completion(nil)
                return
            }
            completion(image)
            self.imageCache.cacheImage(image, for: url)
        }
    }
}
