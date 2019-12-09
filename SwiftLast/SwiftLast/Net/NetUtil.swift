//
//  NetUtil.swift
//  SwiftLast
//
//  Created by 許宸禎 on 2019/12/7.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import Foundation

import Alamofire

class NetUtil{
    static let SERVER_URL: String = "https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001"
    
 
    static func get(city: String, completion: @escaping(Int) -> ()){
        
        let currentWeather = CurrentWeather.self
        
        let url: String = "\(SERVER_URL)"
        let params: Parameters = ["Authorization": "CWB-CE8D0CFC-BBC6-4A3E-A6CA-EFF135224A9F", "format": "JSON","locationName":city]
        Alamofire.request(url,parameters: params).responseJSON {
        (response) in
            if response.result.isSuccess{
                let decoder = JSONDecoder()
                if let result = response.data, let weatherResult = try? decoder.decode(currentWeather, from: result) {
                        print("Success")
                    if(!weatherResult.records.location.isEmpty){
                    CityData.addCity(data: Data(type: city,describe: "Success",currentWeather: weatherResult))
                    }else{
                        CityData.addCity(data: Data(type: city,describe: "Failure"))
                    }
                }else{
                    print("QQ")
                }
            }
            else{
                print("CONNECT ERROR")
            }
            completion(0)
        }
    }
}
