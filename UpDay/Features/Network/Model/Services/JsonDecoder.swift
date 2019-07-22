//
//  JSONDecoder.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/15/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct JsonDecoder : JSONDecoderContract {
    func decodeJSON<T>(type: T.Type, from: Data?) -> T? where T : Decodable {
        let decoder = JSONDecoder()
        
        guard let data = from,
            let decoded = try? decoder.decode(type.self, from: data) else { return nil }
        
        return decoded
    }
}
