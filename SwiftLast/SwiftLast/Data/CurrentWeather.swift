//
//  CurrentWeather.swift
//  SwiftLast
//
//  Created by 許宸禎 on 2019/12/9.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {
    var records: Record
    var result: Result
    var success: String
}
struct Result: Codable{
    var resource_id: String
    var fields: [Field]
}
struct Field: Codable{
    var id: String
    var type: String
}
struct Record: Codable {
    var datasetDescription: String
    var location: [Location]
}
struct Location: Codable {
    var locationName: String
    var weatherElement: [WeatherElement]
}
struct WeatherElement: Codable {
    var elementName: String
    var time: [Time]
}

struct Time: Codable {
    var endTime: String
    var parameter: [String: String]
    var startTime: String
}
