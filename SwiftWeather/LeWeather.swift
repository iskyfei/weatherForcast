//
//  LeForecast.swift
//  SwiftWeather
//
//  Created by 飞 刘 on 16/3/18.
//  Copyright © 2016年 Jake Lin. All rights reserved.
//

import UIKit

import Foundation
import SwiftyJSON

struct LeForecast {
    let date: String
    let high: String
    let low: String
    
    let dayWeather: String
    let dayWindPower: String
    let dayWindDir: String
    
    let nightWeather: String
    let nightWindPower: String
    let nightWindDir: String
}

/// air quality index
struct LeAqi{
    let aqi: String
    let co: String
    let no2: String
    let o3: String
    let pm10: String
    let pm25: String
    let qlty: String
    let so2: String
}




struct LeWeather {
    let city: String
    let temperature: String
    let humidity: String
    let windpower: String
    let winddir: String
    let sunrise: String
    let sunset: String
    let updatetime: String
    
    let aqi: LeAqi
    let forecasts: [LeForecast]
    
    
    init(data:NSData){
        let json = JSON(data: data)
        
        city = json["city"].string!
        temperature = json["temperature"].string!
        humidity = json["humidity"].string!
        windpower = json["windpower"].string!
        winddir = json["winddir"].string!
        sunrise = json["sunrise"].string!
        sunset = json["sunset"].string!
        updatetime = json["updatetime"].string!
        
        
        let vaq = json["env"]["aqi"].string
        let co = json["env"]["co"].string
        let no2 = json["env"]["no2"].string
        let o3 = json["env"]["o3"].string
        let pm10 = json["env"]["pm10"].string
        let pm25 = json["env"]["pm25"].string
        let qlty = json["env"]["qlty"].string
        let so2 = json["env"]["so2"].string
        
        aqi = LeAqi(aqi: vaq!, co: co!, no2: no2!, o3: o3!, pm10: pm10!, pm25: pm25!, qlty: qlty!, so2: so2!)
            
        var vforecasts: [LeForecast] = []
        let arr = json["dailyforcast"].array
        
        for item in arr!{
            let date = item["date"].string
            let high = item["high"].string
            let low = item["low"].string
            let dayWeather = item["day"]["weather"].string
            let dayWindPower = item["day"]["windpower"].string
            let daywinddir = item["day"]["winddir"].string
            let nightWeather = item["night"]["weather"].string
            let nightWindPower = item["night"]["windpower"].string
            let nightWinddir = item["night"]["winddir"].string
            
            let forcast = LeForecast(date: date!, high: high!, low: low!, dayWeather: dayWeather!, dayWindPower: dayWindPower!, dayWindDir: daywinddir!, nightWeather: nightWeather!, nightWindPower: nightWindPower!, nightWindDir: nightWinddir!)
            
            vforecasts.append(forcast)
        }
        
        forecasts = vforecasts
    }
    

}
