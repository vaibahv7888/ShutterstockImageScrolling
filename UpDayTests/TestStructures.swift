//
//  TestStructures.swift
//  UpDayTests
//
//  Created by Vaibhav Bangde on 7/22/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import XCTest
import Swinject
import SwinjectAutoregistration

@testable import UpDay

extension Assets {
    init(largeThumb:Asset) {
        self.init(preview: largeThumb, small_thumb: largeThumb, large_thumb: largeThumb, huge_thumb: largeThumb, preview_1000: largeThumb, preview_1500: largeThumb)
    }
}

extension Asset {
    init(url:String) {
        self.init(height: 100, url: url, width: 100)
    }
}

class TestStructures: XCTestCase {
    private let container = Container()
    
    override func setUp() {
        super.setUp()
        container.autoregister(Assets.self, argument: Asset.self, initializer: Assets.init(largeThumb:))
        container.autoregister(Asset.self, argument: String.self, initializer: Asset.init(url:))
    }
    
    override func tearDown() {
        super.tearDown()
        container.removeAll()
    }
    
    func testAssetsLargeThumbnail() {
        let asset = Asset(url: "TestURL")
        let assets = Assets(largeThumb: asset)
        XCTAssertEqual(assets.large_thumb.url, "TestURL")
    }
    
    func testAsset() {
        let asset = Asset(url: "Test Asset")
        XCTAssertEqual(asset.url, "Test Asset")
    }
}
