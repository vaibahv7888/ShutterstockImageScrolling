//
//  ReadPListFile.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct ReadPListFile : ReadPListFileContract {
    func readPListFile(for pListFileName: String) -> [String : String]? {
        guard let pListFileUrl = Bundle.main.url(forResource: pListFileName,
                                                withExtension: "plist") else {
                                                    return nil
        }
        return NSDictionary(contentsOf: pListFileUrl) as? [String: String]
    }
}
