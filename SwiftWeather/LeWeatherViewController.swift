//
//  LeWeatherViewController.swift
//  SwiftWeather
//
//  Created by 飞 刘 on 16/3/18.
//  Copyright © 2016年 Jake Lin. All rights reserved.
//

import UIKit

class LeWeatherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UILabel!
    

    
    
    var weatherView: LeWeatherView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherView = NSBundle.mainBundle().loadNibNamed("LeWeatherView", owner: self, options: nil)[0] as? LeWeatherView;
        weatherView!.frame = self.view.bounds
        self.view.addSubview(weatherView!)
        
      
        let leVoice = LeVoiceWeatherService()
        leVoice.retrieveWeatherInfo("天津") {(weather, error) -> Void in
            
            if let unwrappedError = error {
                print(unwrappedError)
                return
            }
            
            guard let unwrappedWeather = weather else {
                return
            }
            
            print("\(unwrappedWeather)")
            
            dispatch_async(dispatch_get_main_queue(), {[weak self] () -> Void in
                self?.updateWeather(unwrappedWeather)
            })
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWeather(weather:LeWeather!){
        weatherView?.loadData(weather)
    }
}
