//
//  DateHandler.swift
//  weatherApp
//
//  Created by David Grammatico on 19/07/2023.
//

import Foundation

class DateHandler {
    func fromTimestampToString (_ timestamp: Int) -> String {
        let double = Double(timestamp)
        let date = Date(timeIntervalSince1970: double)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr-FR")
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
