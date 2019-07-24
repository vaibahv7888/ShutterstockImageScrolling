//
//  PicturesViewModelContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/17/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol PicturesViewModelContract {
    var pageIndex:Int { get set }
    func getAuthenticationToken(completion:@escaping (Bool)->Void)
    func getNumberOfItemsInSection() -> Int
    func getLargeThumnailsPicture(for index:Int) -> Asset?
    func getPreview1000(for index:Int) -> Asset?
    func getPictureDescription(for index:Int) -> String?
    func beginBatchFetchPictures(completion:@escaping (Bool?)->Void)
    func fetchImage(for url:String, completion:@escaping (UIImage?)->Void) -> ImageRequest?
}
