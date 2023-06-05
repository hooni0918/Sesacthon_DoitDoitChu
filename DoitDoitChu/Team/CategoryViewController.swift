//
//  CategoryViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/04.
//


import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var relationshipImage: UIImageView!
    @IBOutlet weak var challengeImage: UIImageView!
    @IBOutlet weak var exerciseImage: UIImageView!
    @IBOutlet weak var bobImage: UIImageView!
    @IBOutlet weak var sleepImage: UIImageView!
    @IBOutlet weak var feelImage: UIImageView!

    var isImageFlipped: [UIImageView: Bool] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()

        let images: [UIImageView] = [relationshipImage, challengeImage, exerciseImage, bobImage, sleepImage, feelImage]
        for image in images {
            isImageFlipped[image] = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            image.addGestureRecognizer(tapGesture)
            image.isUserInteractionEnabled = true
        }
    }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        if let imageView = sender.view as? UIImageView {
            if isImageFlipped[imageView] ?? false {
                isImageFlipped[imageView] = false
                let toImage = UIImage(named: "Rectangle 611")
                UIView.transition(with: imageView, duration: 0.3, options: .transitionFlipFromLeft, animations: { imageView.image = toImage }, completion: nil)
            } else {
                isImageFlipped[imageView] = true
                let toImage = UIImage(named: "OriginalImage")
                UIView.transition(with: imageView, duration: 0.3, options: .transitionFlipFromLeft, animations: { imageView.image = toImage }, completion: nil)
            }
        }
    }
}


