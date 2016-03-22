//
//  Created by Jake Lin on 9/11/15.
//  Copyright © 2015 Jake Lin. All rights reserved.
//

import Foundation

struct ForecastString {
    
  
   static func dateToWeek(dateTxt:String)->String{
        
        let dateFormater = NSDateFormatter.init()
        dateFormater.dateFormat = "yyyy-MM-dd"
        dateFormater.timeZone = NSTimeZone.init(forSecondsFromGMT: 8)
        let date = dateFormater.dateFromString(dateTxt)
        let calendar = NSCalendar.init(calendarIdentifier: NSCalendarIdentifierChinese)
        let comps = calendar?.component(NSCalendarUnit.WeekdayOrdinal, fromDate: date!)
       
        switch comps!{
        
        case 0:
            return "周日"
        case 1:
            return "周一"
        case 2:
            return "周二"
        case 3:
            return "周三"
        case 4:
            return "周四"
        case 5:
            return "周五"
        case 6:
            return "周六"
    
        default:
             return "N/A"
        }
    }
    
    static func toIconFont(text:String)->String{
        
        switch text{
        case "Navi_icon":
            return "\u{e930}"
        case "度":
            return "\u{e900}"
        case "晴":
            return "\u{e91e}"
        case "晴天":
            return "\u{e91e}"
        case "晴1":
            return "\u{e919}"
        case "晴天1":
            return "\u{e919}"
        case "晴间多云":
            return "\u{e913}"
        case "晴间多云1":
            return "\u{e914}"
        case "多云":
            return "\u{e913}"
        case "多云1":
            return "\u{e914}"
            
        case "阴":
            return "\u{e903}"
        case "阴天":
            return "\u{e903}"
        
        case "小雨":
            return "\u{e90b}"
        case "中雨":
            return "\u{e90a}"
        case "大雨":
            return "\u{e904}"
        case "阵雨":
            return "\u{e902}"
        case "暴雨":
            return "\u{e90a}"
        case "大暴雨":
            return "\u{e904}"
        case "特大暴雨":
            return "\u{e904}"
        case "雷阵雨":
            return "\u{e901}"
        case "雨夹雪":
            return "\u{e904}"
        case "雷阵雨伴有冰雹":
            return "\u{e904}"
        case "冰雹":
            return "\u{e904}"
        case "冻雨":
            return "\u{e904}"
            
        case "阵雪":
            return "\u{e907}"
        case "小雪":
            return "\u{e907}"
        case "中雪":
            return "\u{e906}"
        case "大雪":
            return "\u{e905}"
        case "暴雪":
            return "\u{e905}"
            
        case "雾":
            return "\u{e910}"
        case "扬沙":
            return "\u{e910}"
        case "浮尘":
            return "\u{e910}"
        case "沙尘暴":
            return "\u{e910}"
        case "强沙尘暴":
            return "\u{e910}"
        case "霾":
            return "\u{e910}"
        case "雾霾":
            return "\u{e910}"
            
        default:
            return "\u{e91e}";
        }

    }
}
