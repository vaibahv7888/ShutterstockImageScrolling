//
//  ApiEndPointProvider.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/23/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct ApiEndPointProvider : ApiEndPointProviderContract {
    let readPLisstFile : ReadPListFileContract!
    private var apiEndPointDictionary: [String: String]?
    
    init(readPListFile : ReadPListFileContract) {
        self.readPLisstFile = readPListFile
        self.apiEndPointDictionary = self.readPLisstFile.readPListFile(for: ApiEndPoint.baseUrl.apiPListFileName)
    }
    
    func apiUrl(_ apiEndpoint: ApiEndPoint) -> URL? {
        switch apiEndpoint {
        case .baseUrl:
            return self.apiBaseUrl()
        case .fetchToken:
            return self.apiBaseUrl()?.appendingPath(self.apiEndpoint(apiEndpoint))
        case .imageSearch:
            return self.apiBaseUrl()?.appendingPath(self.apiEndpoint(apiEndpoint))
        }
    }
}

extension ApiEndPointProvider {
    func apiEndpoint(_ apiEndpoint: ApiEndPoint) -> String? {
        return self.apiEndPointDictionary?[apiEndpoint.apiEndpointKey]
    }
}

extension ApiEndPointProvider {
    private func apiBaseUrl() -> URL?{
        guard let urlString = self.apiEndPointDictionary?[ApiEndPoint.baseUrl.apiEndpointKey] else {
            return nil
        }
        return URL(string: urlString)
    }
}
