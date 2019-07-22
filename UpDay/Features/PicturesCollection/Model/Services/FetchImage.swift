//
//  FetchImage.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/18/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

struct FetchImage : FetchImageContract {
    var apiService : ApiServiceContract!
    
    init(apiService:ApiServiceContract) {
        self.apiService = apiService
    }
    
    func fetchImage(url: String, completion: @escaping (UIImage?) -> Void) -> ImageRequest? {
        return self.apiService.downloadImage(url: url, completion: { (response) in
            guard let image = response else {
                completion(nil)
                return
            }
            completion(image)
        })
    }
}
