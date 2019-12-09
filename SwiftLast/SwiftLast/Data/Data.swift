//
//  Data.swift
//  SwiftLast
//
//  Created by 許宸禎 on 2019/12/7.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import Foundation

class Data {
    
    
    var type = ""
    var describe = ""
    var locationName = ""
    var currentWeather: CurrentWeather?
    
    init(type: String, describe: String, currentWeather: CurrentWeather) {
        self.type = type
        self.describe = describe
        self.currentWeather = currentWeather
        print(type)
        print(currentWeather)
    }
    
    init(type: String, describe: String) {
           self.type = type
           self.describe = describe
    }
}
