//
//  AppDelegate.swift
//  HW22
//
//  Created by Роман Литвинович on 23.09.23.
//

import UIKit

class CardDetailVC: UIViewController {
    var index: Int!

    var card: Card {
        CardsData.shared.cards[index]
    }

    @IBOutlet var cardStackView: UIStackView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var cardNameLbl: UILabel!
    @IBOutlet var cardPriceLbl: UILabel!
    @IBOutlet var ratingLbl: UILabel!
    @IBOutlet var showReviewBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: view.bounds.size)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateUI(with: size)
    }

    private func updateUI(with size: CGSize) {
        let isVertical = size.width < size.height
        cardStackView.axis = isVertical ? .vertical : .horizontal
        title = card.name
        imageView.image = card.image
        cardNameLbl.text = card.name
        ratingLbl.text = CardsData.shared.rating
        cardPriceLbl.text = card.price
        showReviewBtn.setTitle("Посмотреть (\(Feedback.feedBacks.count)) отзывов", for: .normal)

        //showReviewBtn.isEnabled = Card.feedBacks.count != 0
    }

    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    }
}
