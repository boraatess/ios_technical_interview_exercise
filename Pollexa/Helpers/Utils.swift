//
//  Utils.swift
//  Pollexa
//
//  Created by bora ateş on 12.06.2024.
//

import Foundation

class Utils {
    
    static let shared = Utils()
    
    func calculateTimeDifference(from date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date, to: now)
        
        let years = components.year ?? 0
        let months = components.month ?? 0
        let days = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        var result = ""
        if years > 0 {
            result += "\(years) years ago"
            return result
        }
        if months > 0 {
            result += "\(months) months ago"
            return result
        }
        if days > 0 {
            result += "\(days) days ago"
            return result
        }
        if hours > 0 {
            result += "\(hours) hours ago"
            return result
        }
        if minutes > 0 {
            result += "\(minutes) minutes ago"
            return result
        }
        if seconds > 0 {
            result += "\(seconds) second ago"
            return result
        }
        return "Now"
    }

    func formatNumber(_ myNumber: Double) -> String? {
    
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        
        if let formattedNumberString = formatter.string(from: NSNumber(value: myNumber)) {
            return formattedNumberString
        }
        
        return nil
    }
    
}


