//
//  ReviewsPageViewController.swift
//  HW22
//
//  Created by Роман Литвинович on 24.09.23.
//

import UIKit

class ReviewViewController: UIViewController, UITextViewDelegate, UIGestureRecognizerDelegate {
    var index: Int?
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var grade: UISegmentedControl!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var reviewStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateUI(with: size)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        updateUIForTextLength(textView: textView)
    }
    
    private func updateUI(with size: CGSize) {
        let isVertical = size.width < size.height
        reviewStack.axis = isVertical ? .vertical : .horizontal
    }
    
    func updateUIForTextLength(textView: UITextView) {
        guard let text = textView.text else {
            return
        }
        
        let minLength = 20
        if text.count < minLength {
            errorLbl.isHidden = false
            saveButton.isEnabled = false
        } else {
            errorLbl.isHidden = true
            saveButton.isEnabled = true
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let feedback = Feedback(text: textView.text, mark: Double(grade.selectedSegmentIndex + 1))
        CardsData.shared.cards[index ?? 0].feedbacks.append(feedback)
        navigationController?.popToRootViewController(animated: true)
    }
   
    private func setupUI() {
        errorLbl.isHidden = true
        textView.delegate = self
        textView.backgroundColor = .systemGray6
        textView.cornersRound()
        saveButton.cornersRoundInHeight()
        swipeAction()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    func swipeAction() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
                swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
                self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func hideKeyboardOnSwipeDown() {
            view.endEditing(true)
        }
}


