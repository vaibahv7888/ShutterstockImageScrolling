//
//  NetworkAssembly.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/14/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(ApiServiceContract.self, initializer: ApiService.init)
    }
}
