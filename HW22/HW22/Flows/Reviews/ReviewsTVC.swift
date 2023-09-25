//
//  AppDelegate.swift
//  HW22
//
//  Created by Роман Литвинович on 23.09.23.
//

import UIKit

class ReviewsTVC: UITableViewController {
    var index: Int?
    
    var cards: Card {
        get {
            CardsData.shared.cards[index ?? 0]
        }
        set {
            CardsData.shared.cards[index ?? 0] = newValue
        }
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTVC")
        self.navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.feedbacks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feedback = cards.feedbacks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTVC", for: indexPath) as! ReviewTableViewCell
        cell.dateLbl.text = feedback.dateString
        cell.feedbackLbl.text = feedback.text
        cell.ratingLbl.text = feedback.ratingStarsString
        
        cell.showsReorderControl = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cards.feedbacks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
