//
//  AppDelegate.swift
//  HW22
//
//  Created by Роман Литвинович on 23.09.23.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var feedbackLbl: UILabel!
    @IBOutlet var ratingLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
