//
//  GetConstantToken.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/24/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import Foundation

struct GetConstantToken : GetConstantTokenContract {
    let access_token = "v2/ZTFlZDUtNjFmYjMtOWExNDUtMmRiZTEtY2Y2ZWQtNTFhNjcvMjM5MTY3ODIxL2N1c3RvbWVyLzMvcDZqczBSTDNzd2VpaDFEeUZKOE11SUVvbFpaelNZczdLeHBVNHJKbWJsczdDM2NUSVZCV01tWVY2ckJYZlBRb2M1MEttQnlCLUZfNUlTSDJ3YlVad3Y3YVBneklpYllrUHRSSTdEelFUZWpKXzFEUTV1LWNwVlBHemJ1UEgzOWpoWFJRUzhGVFBVOHlfY094cHZfNnd0NWt4LUxSYUFLenZfNGxINXBwZmdOLUt1UWhTam5mWkpxWHJNWUhfYTBKb2JoNzY4VFBMRWZlQjJlOTZpSjVqUQ"
    let token_type = "Bearer"
    func getConstantToken(completion: @escaping (AccessToken?) -> Void) {
        let accessToken = AccessToken(access_token: self.access_token, token_type: self.token_type)
        completion(accessToken)
    }
}
