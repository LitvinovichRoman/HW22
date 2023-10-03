//
//  AppDelegate.swift
//  HW22
//
//  Created by Роман Литвинович on 23.09.23.
//

import UIKit

class CardDetailVC: UIViewController {
    var index: Int!
    
    var cards: Card { CardsData.shared.cards[index] }
    
    @IBOutlet weak var cardStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cardNameLbl: UILabel!
    @IBOutlet weak var cardPriceLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var showReviewBtn: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
    
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
        
        title = cards.name
        imageView.image = cards.image
        cardNameLbl.text = cards.name
        ratingLbl.text = cards.averageRating != nil ? cards.ratingStarsString : "Нет рейтинга"
        cardPriceLbl.text = cards.price
        
        showReviewBtn.setTitle("Посмотреть (\(cards.feedbacks.count)) отзывов", for: .normal)
        showReviewBtn.isEnabled = cards.feedbacks.count != 0
        showReviewBtn.cornersRoundInHeight()
        reviewButton.cornersRoundInHeight()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ReviewsTVC { dest.index = index }
        if let dest = segue.destination as? ReviewViewController { dest.index = index }
    }
}
