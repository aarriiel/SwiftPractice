//
//  NetUtil.swift
//  swiftHW2
//
//  Created by 許宸禎 on 2019/11/19.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import Foundation
import Alamofire


class NetUtil{

     static let SERVER_URL: String = "127.0.0.1"
     static let SERVER_PORT: Int = 8000

 
    static func post(uri: String, json: [String: String], completion: @escaping(Int) -> ()){
        let url: String = "http://\(SERVER_URL):\(SERVER_PORT)/\(uri)/"
        print(json)
        Alamofire.request(url, method: .post, parameters: json,encoding: JSONEncoding.default).responseJSON {
        (response) in
            if response.result.isSuccess{
                if let results = response.result.value as? [String: Int]{
                    switch results["statusCode"]{
                    case 0:
                       completion(0)
                    default:
                       print("Wrong User or Password!")
                    }
                }
            }
            else{
                print("CONNECT ERROR")
            }
                
        }
    }
}
