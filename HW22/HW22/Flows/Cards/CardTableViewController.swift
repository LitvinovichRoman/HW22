//
//  AppDelegate.swift
//  HW22
//
//  Created by Роман Литвинович on 23.09.23.
//

import UIKit

class CardTableViewController: UITableViewController {
    
    let cellManager = CellManager()

    var cards: [Card] {
        CardsData.shared.cards
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let card = cards[indexPath.row]
    
        CellManager.configure(cell, with: card)

        return cell
    }
    
    @IBAction func unwindToCardDetailVC(_ unwindSegue: UIStoryboardSegue) {
        tableView.reloadData()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToCardDetailVC" else { return }

        guard let indexPath = tableView.indexPathForSelectedRow,
              let cardDetailVC = segue.destination as? CardDetailVC else { return }
        cardDetailVC.index = indexPath.row
        
    }
}
