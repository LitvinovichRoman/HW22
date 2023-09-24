//
//  ReviewsPageViewController.swift
//  HW22
//
//  Created by Роман Литвинович on 24.09.23.
//

import UIKit

class ReviewViewController: UIViewController, UITextViewDelegate {
    
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
    
    @IBAction func gradeChange(_ sender: UISegmentedControl) {
        let index = grade.selectedSegmentIndex
        if let title = grade.titleForSegment(at: index) {
            CardsData.shared.rating = title
        } else {
            return
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        CardsData.shared.feedback = textView.text
        navigationController?.popToRootViewController(animated: true)
    }
   
    private func setupUI() {
        errorLbl.isHidden = true
        textView.delegate = self
        textView.backgroundColor = .systemGray6
        textView.layer.cornerRadius = 15
        textView.layer.masksToBounds = true
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



