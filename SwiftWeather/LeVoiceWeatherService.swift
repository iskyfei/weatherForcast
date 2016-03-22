//
// Created by Jake Lin on 9/2/15.
// Copyright (c) 2015 Jake Lin. All rights reserved.
//

import Foundation
import CoreLocation

import SwiftyJSON

typealias LeWeatherCompletionHandler = (LeWeather?, Error?) -> Void

class  LeVoiceWeatherService: NSObject {

    private let urlPath = ""
    
    func retrieveWeatherInfo(city: String, completionHandler: LeWeatherCompletionHandler) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig)
        
        let url = NSURL.init(string: urlPath)
    
        
        
        if urlPath.isEmpty{
            self.testData(completionHandler)
            return
        }
        
        
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        
        let bodyText = "{\"city\":\"\(city)\"}"
        
        request.HTTPBody = bodyText.dataUsingEncoding(NSUTF8StringEncoding)
        
        
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, networkError) -> Void in
           
            
            // Check network error
            if networkError != nil {
                let error = Error(errorCode: .NetworkRequestFailed)
                completionHandler(nil, error)
                return
            }
            
            // Check JSON serialization error
            guard let unwrappedData = data else {
                let error = Error(errorCode: .JSONSerializationFailed)
                completionHandler(nil, error)
                return
            }
            
            let str = String.init(data: data!, encoding: NSUTF8StringEncoding)
            
            print(str)
            
            let json = JSON(data: unwrappedData)
            
            let errnum = json["errnum"].int
            if (errnum != 0){
                let error = Error(errorCode: .ServerReponseError)
                completionHandler(nil, error)
                return
            }
            
            let weather = LeWeather.init(data: data!)
            
            print("\(weather)" )
            
            completionHandler(weather, nil)
        })
        
        task.resume()
    }
    
    func testData(completionHandler: LeWeatherCompletionHandler ){
        
        
        let str = "{\"errnum\":0,\"city\":\"天津\",\"temperature\":\"9\",\"humidity\":\"49%\",\"windpower\":\"1级\",\"winddir\":\"东南风\",\"sunrise\":\"06:12\",\"sunset\":\"18:26\",\"updatetime\":\"18:15\",\"env\":{\"aqi\":\"83\",\"co\":\"1\",\"no2\":\"44\",\"o3\":\"27\",\"pm10\":\"114\",\"pm25\":\"43\",\"qlty\":\"良\",\"so2\":\"20\"},\"dailyforcast\":[{\"date\":\"2016-03-22\",\"high\":\"15\",\"low\":\"6\",\"day\":{\"weather\":\"阴\",\"windpower\":\"3-4级\",\"winddir\":\"东北风\"},\"night\":{\"weather\":\"阴\",\"windpower\":\"4-5级\",\"winddir\":\"东北风\"}},{\"date\":\"2016-03-23\",\"high\":\"13\",\"low\":\"3\",\"day\":{\"weather\":\"晴\",\"windpower\":\"4-5级\",\"winddir\":\"北风\"},\"night\":{\"weather\":\"晴\",\"windpower\":\"微风级\",\"winddir\":\"北风\"}},{\"date\":\"2016-03-24\",\"high\":\"14\",\"low\":\"4\",\"day\":{\"weather\":\"晴\",\"windpower\":\"微风级\",\"winddir\":\"南风\"},\"night\":{\"weather\":\"晴\",\"windpower\":\"3-4级\",\"winddir\":\"北风\"}},{\"date\":\"2016-03-25\",\"high\":\"15\",\"low\":\"6\",\"day\":{\"weather\":\"晴\",\"windpower\":\"微风级\",\"winddir\":\"北风\"},\"night\":{\"weather\":\"晴\",\"windpower\":\"微风级\",\"winddir\":\"西南风\"}},{\"date\":\"2016-03-26\",\"high\":\"17\",\"low\":\"8\",\"day\":{\"weather\":\"晴\",\"windpower\":\"微风级\",\"winddir\":\"西南风\"},\"night\":{\"weather\":\"晴\",\"windpower\":\"3-4级\",\"winddir\":\"西南风\"}}]}"
        
        let data =  str.dataUsingEncoding(NSUTF8StringEncoding)
        let json = JSON(data: data!)
        
        let errnum = json["errnum"].int
        if (errnum != 0){
            let error = Error(errorCode: .ServerReponseError)
            completionHandler(nil, error)
            return
        }
        
        let weather = LeWeather.init(data: data!)
        
        print("\(weather)" )
        
        completionHandler(weather, nil)

    }
    
  }
