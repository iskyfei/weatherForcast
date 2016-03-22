//
//  LeWeatherView.swift
//  SwiftWeather
//
//  Created by 飞 刘 on 16/3/21.
//  Copyright © 2016年 Jake Lin. All rights reserved.
//

import UIKit

class LeWeatherView: UIView {

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureCurrent: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var dayA: LeWeatherSubAView!
    @IBOutlet weak var dayB: LeWeatherSubAView!
    @IBOutlet weak var dayC: LeWeatherSubAView!
    
    @IBOutlet weak var day1: LeWeatherSubBView!
    @IBOutlet weak var day2: LeWeatherSubBView!
    @IBOutlet weak var day3: LeWeatherSubBView!
    @IBOutlet weak var day4: LeWeatherSubBView!
    @IBOutlet weak var day5: LeWeatherSubBView!
    
    
    func loadData(weather: LeWeather){
        
        cityLabel.text =  ForecastString.toIconFont("Navi_icon") + weather.city
        
        let today = weather.forecasts[0]
        weatherLabel.text = today.dayWeather
        
        temperatureCurrent.text =  weather.temperature
        
        dayA.date = "今天"
        dayA.weather = today.dayWeather
        dayA.icon = ForecastString.toIconFont(today.dayWeather)
        dayA.temperature = today.low + "\u{e900}/" + today.high + "\u{e900}"
        
        day1.date = ForecastString.dateToWeek(today.date)
        day1.weather = today.dayWeather
        day1.icon = ForecastString.toIconFont(today.dayWeather)
        day1.temperature = today.low + "\u{e900}/" + today.high + "\u{e900}"
        day1.wind = today.dayWindPower
        
        let dayB2 = weather.forecasts[1]
        dayB.date = "明天"
        dayB.weather = dayB2.dayWeather
        dayB.icon = ForecastString.toIconFont(dayB2.dayWeather)
        dayB.temperature = dayB2.low + "\u{e900}/" + dayB2.high + "\u{e900}"
        
        day2.date = ForecastString.dateToWeek(dayB2.date)
        day2.weather = dayB2.dayWeather
        day2.icon = ForecastString.toIconFont(dayB2.dayWeather)
        day2.temperature = dayB2.low + "\u{e900}/" + dayB2.high + "\u{e900}"
        day2.wind = dayB2.dayWindPower
        
        let dayC3 = weather.forecasts[2]
        dayC.date = "后天"
        dayC.weather = dayC3.dayWeather
        dayC.icon = ForecastString.toIconFont(dayC3.dayWeather)
        dayC.temperature = dayC3.low + "\u{e900}/" + dayC3.high + "\u{e900}"
        
        day3.date = ForecastString.dateToWeek(dayC3.date)
        day3.weather = dayC3.dayWeather
        day3.icon = ForecastString.toIconFont(dayC3.dayWeather)
        day3.temperature = dayC3.low + "\u{e900}/" + dayC3.high + "\u{e900}"
        day3.wind = dayC3.dayWindPower
        
        
        let dayD = weather.forecasts[3]
       
        day4.date = ForecastString.dateToWeek(dayD.date)
        day4.weather = dayD.dayWeather
        day4.icon = ForecastString.toIconFont(dayD.dayWeather)
        day4.temperature = dayD.low + "\u{e900}/" + dayD.high + "\u{e900}"
        day4.wind = dayD.dayWindPower
        
        let dayE = weather.forecasts[4]
        
        day5.date = ForecastString.dateToWeek(dayE.date)
        day5.weather = dayE.dayWeather
        day5.icon = ForecastString.toIconFont(dayE.dayWeather)
        day5.temperature = dayE.low + "\u{e900}/" + dayE.high + "\u{e900}"
        day5.wind = dayE.dayWindPower
        
    }

}
