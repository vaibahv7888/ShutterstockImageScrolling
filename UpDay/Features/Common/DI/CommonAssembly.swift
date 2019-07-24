//
//  CommonAssembly.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class CommonAssembly : Assembly {
    func assemble(container: Container) {
        container.autoregister(ApiEndPointProviderContract.self, initializer: ApiEndPointProvider.init)
        container.autoregister(ReadPListFileContract.self, initializer: ReadPListFile.init)
    }
}
