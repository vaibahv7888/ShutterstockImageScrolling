//
//  FetchPicturesService.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/15/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct FetchPicturesService : FetchPicturesServiceContract {
    let fetchPicturesApi : FetchPicturesApiContract!
    let decoder : JSONDecoderContract!
    
    init(fetchPicturesApi : FetchPicturesApiContract, decoder : JSONDecoderContract) {
        self.fetchPicturesApi = fetchPicturesApi
        self.decoder = decoder
    }
    
    func fetchPictures(pageIndex:Int, completion: @escaping (PicturesList?) -> Void) {
        self.fetchPicturesApi.fetchPictures(pageIndex: pageIndex, completion : { response in
            guard let picturesList  = self.decoder.decodeJSON(type: PicturesList.self, from: response) else {
                completion(nil)
                return
            }
            completion(picturesList)
        })
    }
}
