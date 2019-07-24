//
//  ShutterPictureViewModel.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/20/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

class ShutterPictureViewModel : ShutterPictureViewModelContract {
    let shutterPictureService : ShutterPictureServiceContract!
    
    init(shutterPictureService:ShutterPictureServiceContract) {
        self.shutterPictureService = shutterPictureService
    }
    
    func fetchShutterPicture(url: String, completion: @escaping (UIImage?) -> Void) -> ImageRequest? {
        return self.shutterPictureService.fetchShutterPicture(url: url, completion: { (response) in
            guard let image = response else {
                completion(nil)
                return
            }
            completion(image)
        })
    }
}
