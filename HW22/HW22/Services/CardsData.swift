//
//  AppDelegate.swift
//  HW22
//
//  Created by Роман Литвинович on 23.09.23.
//

import Foundation

class CardsData {
    static let shared = CardsData()

    var cards: [Card]
    var feedback: String?
    var rating: String?

    private init() {
        cards = [
            Card(name: "Don Mattingly", price: "$70", image: #imageLiteral(resourceName: "1-DonMattingly_1")),
            Card(name: "Kirby Puckett", price: "$60", image: #imageLiteral(resourceName: "2-KirbyPuckett")),
            Card(name: "Bo Jackson", price: "$60", image: #imageLiteral(resourceName: "3-BoJackson")),
            Card(name: "Mark McGwire", price: "$50", image: #imageLiteral(resourceName: "4-MarkMcGwire")),
            Card(name: "Rickey Henderson", price: "$50", image: #imageLiteral(resourceName: "5-RickeyHenderson"))
        ]
    }
}
