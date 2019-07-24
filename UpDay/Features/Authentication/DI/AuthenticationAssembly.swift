//
//  AuthenticationAssembly.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/20/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class AuthenticationAssembly : Assembly {
    func assemble(container: Container) {
        container.autoregister(AuthenticationTokenInteractorContract.self, initializer: AuthenticationTokenInteractor.init)
        container.autoregister(FetchAuthenticateTokenContract.self, initializer: FetchAuthenticateToken.init)
        container.autoregister(AuthenticationTokenApiContract.self, initializer: AuthenticationTokenApi.init)
        container.autoregister(GetConstantTokenContract.self, initializer: GetConstantToken.init)
    }
}
