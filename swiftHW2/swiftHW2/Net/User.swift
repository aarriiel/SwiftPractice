//
//  User.swift
//  swiftHW2
//
//  Created by 許宸禎 on 2019/11/19.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import Foundation

class User{
    static func login(username: String, password: String,completionHandler: @escaping (Int) -> Void){
        let url: String = "user/login"
        var json : [String: String] = [
            "username": username,
            "password": password
        ]
        
        NetUtil.post(uri: url,json: json){
            result in
            completionHandler(result)
        }
        
    }
}
