//
//  FetchShutterPictureContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/20/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

protocol ShutterPictureServiceContract {
    func fetchShutterPicture(url:String, completion: @escaping(UIImage?)->Void) -> ImageRequest?
}
