//
//  SimulatedNteworkTest.swift
//  UpDayTests
//
//  Created by Vaibhav Bangde on 7/22/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import XCTest
import Swinject
import SwinjectAutoregistration

@testable import UpDay

struct SimulatedNetworking : ApiServiceContract {
    let filename: String
    
    func get(_ apiUrl: URL?, authenticationRequired: Bool, queryParameters: [String : Any]?, httpHeaders: [String : String]?, completion: @escaping (Data?) -> Void) {
        let data = readJSON(name: filename)// "dataset_page1")
        completion(data)
    }
    
    func post(_ apiUrl: URL?, authenticationRequired: Bool, queryParameters: [String : Any]?, httpHeaders: [String : String]?, completion: @escaping (Data?) -> Void) {
        let data = readJSON(name: filename)//"dataset_page1")
        completion(data)
    }
    
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) -> ImageRequest? {
        completion(nil)
        return nil
    }
    
    private func readJSON(name: String) -> Data? {
        let bundle = Bundle(for: SimulatedNteworkTest.self)
        print("name = \(name)")
        guard let url = bundle.url(forResource: name, withExtension: "json") else { return nil }
        print("URL = \(url)")
        do {
            return try Data(contentsOf: url, options: .mappedIfSafe)
        }
        catch {
            XCTFail("Error occurred parsing test data")
            return nil
        }
    }

}

struct SimulatedDecoder : JSONDecoderContract {
    let decoder : JSONDecoder
    func decodeJSON<T>(type: T.Type, from: Data?) -> T? where T : Decodable {
        guard let data = from,
            let decoded = try? decoder.decode(type.self, from: data) else { return nil }
        
        return decoded
    }
}


class SimulatedNteworkTest: XCTestCase {
    let container = Container()
    
    override func setUp() {
        super.setUp()
        container.autoregister(ApiServiceContract.self,
                               argument: String.self,
                               initializer: SimulatedNetworking.init(filename:))
        
        container.autoregister(FetchPicturesApiContract.self,
                               argument: ApiServiceContract.self,
                               initializer: FetchPicturesApi.init(apiService:))
        
        container.autoregister(JSONDecoderContract.self,
                               argument: JSONDecoder.self,
                               initializer: SimulatedDecoder.init(decoder:))
        
        container.register(FetchPicturesService.self, name: "dataset-one") { (resolver) in
            let apiServise = resolver ~> (ApiServiceContract.self, argument: "dataset-one")
            let fetchPictureApi = resolver ~> (FetchPicturesApiContract.self, argument:apiServise)
            let decoder = resolver ~> (JSONDecoderContract.self, argument:JSONDecoder())
            
            return FetchPicturesService(fetchPicturesApi: fetchPictureApi, decoder: decoder)
        }
    }

    override func tearDown() {
        super.tearDown()
        container.removeAll()
    }

    func testPage1() {
        let fetcher = container ~> (FetchPicturesService.self, name:"dataset-one")
        let expectation = XCTestExpectation(description: "Fetch Search Id from dataset one")
        
        fetcher.fetchPictures(pageIndex: 1, completion: { (response) in
            guard let res = response else {
                XCTFail()
                return
            }
            
            XCTAssertEqual("P2wi6AOO88769Hzvw9M0mg", res.search_id)
            expectation.fulfill()
        })
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
