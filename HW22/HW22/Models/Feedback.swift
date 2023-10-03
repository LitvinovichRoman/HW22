//
//  AppDelegate.swift
//  HW22
//
//  Created by Роман Литвинович on 23.09.23.
//

import Foundation

struct Feedback {
    static let date = Date()

    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        return dateFormatter.string(from: Feedback.date)
    }

    let text: String
    let mark: Double

    var ratingStarsString: String {
        String(repeating: "⭐️", count: Int(mark.rounded(.up)))
    }
}
