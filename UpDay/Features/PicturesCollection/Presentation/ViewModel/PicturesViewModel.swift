//
//  PicturesViewModel.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/17/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

class PicturesViewModel : PicturesViewModelContract {
    let fetchPicturesService : FetchPicturesServiceContract!
    let fetchImageInteractor : FetchImageInteractorContract!
    let authenticationTokenInteractor : AuthenticationTokenInteractorContract
    
    var picturesListData = [PictureData]()
    var pageIndex = 0

    init(fetchPictures:FetchPicturesServiceContract,
         fetchImageRepository:FetchImageInteractorContract,
         authenticationTokenInteractor : AuthenticationTokenInteractorContract) {
        self.fetchPicturesService = fetchPictures
        self.fetchImageInteractor = fetchImageRepository
        self.authenticationTokenInteractor = authenticationTokenInteractor
    }
    
    func getAuthenticationToken(completion:@escaping (Bool)->Void) {
        self.authenticationTokenInteractor.getAuthenticationToken { (response) in
            guard let token = response else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    func getNumberOfItemsInSection() -> Int {
        return self.picturesListData.count
    }
    
    func getLargeThumnailsPicture(for index:Int) -> Asset? {
        return picturesListData[index].assets.large_thumb
    }
    
    func getPreview1000(for index:Int) -> Asset? {
        return picturesListData[index].assets.preview_1000
    }
    
    func getPictureDescription(for index:Int) -> String? {
        return picturesListData[index].description
    }
    
    func beginBatchFetchPictures(completion: @escaping (Bool?) -> Void) {
        self.pageIndex += 1
        print("PageIndex = \(pageIndex)")
        self.fetchPicturesService.fetchPictures(pageIndex: self.pageIndex) { (response) in
            guard let pictures = response else {
                completion(nil)
                return
            }
            for data in pictures.data {
                self.picturesListData.append(data)
            }
            completion(true)
        }
    }
    
    func fetchImage(for url: String, completion: @escaping (UIImage?) -> Void) -> ImageRequest? {
        return self.fetchImageInteractor.fetchImage(for: url) { (response) in
            guard let image = response else {
                completion(nil)
                return
            }
            completion(image)
        }
    }
}
