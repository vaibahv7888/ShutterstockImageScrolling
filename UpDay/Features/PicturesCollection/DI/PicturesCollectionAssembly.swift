//
//  PicturesCollectionAssembly.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/14/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class PicturesCollectionAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(FetchPicturesApiContract.self, initializer: FetchPicturesApi.init)
        container.autoregister(FetchPicturesServiceContract.self, initializer: FetchPicturesService.init)
        container.autoregister(JSONDecoderContract.self, initializer: JsonDecoder.init)
        container.autoregister(PicturesViewModelContract.self, initializer: PicturesViewModel.init)
        container.autoregister(FetchImageContract.self, initializer: FetchImage.init)
        container.autoregister(FetchImageInteractorContract.self, initializer: FetchImageInteractor.init)
    }
}
