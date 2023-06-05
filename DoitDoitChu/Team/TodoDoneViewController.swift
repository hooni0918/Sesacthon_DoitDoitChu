//
//  TodoDoneViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/05.
//

import UIKit
import Lottie

class TodoDoneViewController: UIViewController {
    
    @IBOutlet weak var AnimatedView: LottieAnimationView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
    }
    
    func setupAnimation() {
        AnimatedView.contentMode = .scaleAspectFill
        AnimatedView.loopMode = .loop
        AnimatedView.play()
    }
}
