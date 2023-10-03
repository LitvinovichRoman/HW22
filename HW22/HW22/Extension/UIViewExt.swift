//
//  UITextFieldExt.swift
//  HW22
//
//  Created by Роман Литвинович on 25.09.23.
//

import Foundation
import UIKit

extension UIView {
    func cornersRoundInHeight() {
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
    }
    
    func cornersRound() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
}
