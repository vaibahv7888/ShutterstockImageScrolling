//
//  ApiServiceContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/14/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit
import Alamofire

protocol ApiServiceContract {
    func get(_ apiUrl: URL?,
             authenticationRequired:Bool,
             queryParameters:[String:Any]?,
             httpHeaders:[String:String]?,
             completion: @escaping (_ response:Data?) ->Void)
    
    func post(_ apiUrl: URL?,
              authenticationRequired:Bool,
              queryParameters:[String:Any]?,
              httpHeaders:[String:String]?,
              completion: @escaping (_ response:Data?) ->Void)
    
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) -> ImageRequest?
}
