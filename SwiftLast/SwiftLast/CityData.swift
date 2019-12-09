//
//  CityData.swift
//  SwiftLast
//
//  Created by 許宸禎 on 2019/12/7.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import Foundation

class CityData{
    static var cityData : [Data] = []
    
    static func addCity(data: Data){
        cityData.append(data)
    }
    
    static func getCity()-> [Data]{
        return cityData
    }
    
    static func clearCity(){
        cityData.removeAll()
    }
}
