//
//  URL+PathExtension.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

extension URL {
    public func appendingPath(_ pathComponent: String?) -> URL {
        guard let path = pathComponent else {
            return self
        }
        return self.appendingPathComponent(path)
    }
}
