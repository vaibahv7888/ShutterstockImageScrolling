//
//  KeyChainAccessAssembly.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class KeyChainAccessAssembly : Assembly {
    func assemble(container: Container) {
        container.autoregister(KeyChainAccessContract.self, initializer: KeyChainAccess.init)
    }
}
