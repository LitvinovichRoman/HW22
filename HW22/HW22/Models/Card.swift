//
//  AppDelegate.swift
//  HW22
//
//  Created by Роман Литвинович on 23.09.23.
//

import UIKit

struct Card {
    let name: String
    let price: String
    let image: UIImage?
    
    var feedbacks: [Feedback] = []
    
    var ratingStarsString: String {
        guard let rating = averageRating else {
            return ""
        }
        
        let star = "⭐️"
        let numberOfStars = Int(rating.rounded(.up))
        let ratingStars = Array(repeating: star, count: numberOfStars)
        
        return ratingStars.joined()
    }
    
    var averageRating: Double? {
        if feedbacks.isEmpty {
            return nil
        } else {
            let sum = feedbacks.reduce(0) { $0 + $1.mark }
            return sum / Double(feedbacks.count)
        }
    }
}
