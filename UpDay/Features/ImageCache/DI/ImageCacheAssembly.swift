//
//  ImageCacheAssembly.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/19/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ImageCacheAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(ImageCacheContract.self, initializer: ImageCache.init)
    }
}

