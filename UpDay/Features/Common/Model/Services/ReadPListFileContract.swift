//
//  ReadPListFileContract.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

protocol ReadPListFileContract {
    func readPListFile(for pListFileName:String) -> [String:String]?
}
