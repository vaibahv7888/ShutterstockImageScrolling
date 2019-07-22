//
//  FetchPicturesApiContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/15/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

protocol FetchPicturesApiContract {
    func fetchPictures(pageIndex:Int, completion: @escaping (Data?)->Void) -> Void
}
