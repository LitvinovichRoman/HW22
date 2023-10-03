//
//  AppDelegate.swift
//  HW22
//
//  Created by Роман Литвинович on 23.09.23.
//

import UIKit

class CellManager {
    static func configure(_ cell: UITableViewCell, with card: Card) {
        cell.textLabel?.text = card.name
        cell.detailTextLabel?.text = String(card.price) + card.ratingStarsString
        cell.imageView?.image = card.image
    }
}
