//
//  LeWeatherSubAView.swift
//  SwiftWeather
//
//  Created by 飞 刘 on 16/3/21.
//  Copyright © 2016年 Jake Lin. All rights reserved.
//

import UIKit

@IBDesignable class LeWeatherSubAView: UIView {
    var view: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherLebel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        view = loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        view = loadViewFromNib()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName(), bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        addSubview(view);
        
        return view
    }

    @IBInspectable var date: String? {
        get {
            return dateLabel.text
        }
        
        set {
            dateLabel.text = newValue
        }
    }
    
    @IBInspectable var icon: String? {
        get {
            return iconLabel.text
        }
        
        set {
            iconLabel.text = newValue
        }
    }
    
    @IBInspectable var temperature: String? {
        get {
            return temperatureLabel.text
        }
        
        set {
            temperatureLabel.text = newValue
        }
    }
    
    @IBInspectable var weather: String? {
        get {
            return weatherLebel.text
        }
        
        set {
            weatherLebel.text = newValue
        }
    }
    
    @IBInspectable var dateColor: UIColor {
        get {
            return dateLabel.textColor
        }
        
        set {
            dateLabel.textColor = newValue
        }
    }
    
    @IBInspectable var iconColor: UIColor {
        get {
            return iconLabel.textColor
        }
        
        set {
            iconLabel.textColor = newValue
        }
    }
    
    @IBInspectable var temperatureColor: UIColor {
        get {
            return temperatureLabel.textColor
        }
        
        set {
            temperatureLabel.textColor = newValue
        }
    }
    
    @IBInspectable var defaultColor: UIColor {
        get {
            return weatherLebel.textColor
        }
        
        set {
            weatherLebel.textColor = newValue
        }
    }
    
    @IBInspectable var bgColor: UIColor {
        get {
            return view.backgroundColor!
        }
        
        set {
            view.backgroundColor = newValue
        }
    }

    private func nibName() -> String {
        return String(self.dynamicType)
    }
}
