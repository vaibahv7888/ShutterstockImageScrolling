//
//  ShutterPictureAssembly.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/20/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class ShutterPictureAssembly : Assembly {
    func assemble(container: Container) {
        container.autoregister(ShutterPictureViewModelContract.self, initializer: ShutterPictureViewModel.init)
        container.autoregister(ShutterPictureServiceContract.self, initializer: ShutterPictureService.init)
    }
}
