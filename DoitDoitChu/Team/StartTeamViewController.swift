//
//  StartTeamViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/01.
//

import UIKit

class StartTeamViewController: UIViewController {
    
    @IBOutlet weak var nextView: UIView!
    
    @IBOutlet weak var PresentImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItems()
        
        nextView.layer.cornerRadius = 12
        
        shakeAnimation(imageView: PresentImage)
        
        
        
        
    }
    
    
    
    // MARK: - 네비게이션
    private func navigationItems() {
        // 왼쪽 아이템 설정
        let leftImage = UIImage(named: "Group 3")
        let leftImageView = UIImageView(image: leftImage)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftImageView)
        
        // 오른쪽 아이템 설정
        let rightImage1 = UIImage(named: "BellSimple")
        let rightButton1 = UIButton(type: .custom)
        rightButton1.setImage(rightImage1, for: .normal)
        rightButton1.addTarget(self, action: #selector(yourSelector1), for: .touchUpInside)
        
        let rightImage2 = UIImage(named: "UserCircle")
        let rightButton2 = UIButton(type: .custom)
        rightButton2.setImage(rightImage2, for: .normal)
        rightButton2.addTarget(self, action: #selector(yourSelector2), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: rightButton1), UIBarButtonItem(customView: rightButton2)]
        
    }
    
    //짬뽕
    func shakeAnimation(imageView: UIImageView) {
        
    // Position Animation
    let positionAnimation = CABasicAnimation(keyPath: "position")
    positionAnimation.fromValue = NSValue(cgPoint: CGPoint(x: 250, y: 250))
    positionAnimation.toValue = NSValue(cgPoint: CGPoint(x: 120, y: 130))
    
    // Scale Animation
    let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
    scaleAnimation.fromValue = 1.0
    scaleAnimation.toValue = 10.0
    
    // Rotation Animation
    let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
    rotationAnimation.fromValue = 0
    rotationAnimation.toValue = Double.pi * 200
    
    // Opacity Animation
    let opacityAnimation = CABasicAnimation(keyPath: "opacity")
    opacityAnimation.fromValue = 1.0
    opacityAnimation.toValue = 0.0
    
    // Animation Group
    let animationGroup = CAAnimationGroup()
    animationGroup.animations = [positionAnimation, scaleAnimation, rotationAnimation, opacityAnimation]
    animationGroup.duration = 10 // 모든 애니메이션을 1초 동안 수행
    animationGroup.fillMode = .forwards // 애니메이션 완료 후 상태 유지
    animationGroup.isRemovedOnCompletion = false // 애니메이션 완료 후 제거하지 않음
    
    // Add Animation Group to the View's Layer
        imageView.layer.add(animationGroup, forKey: "myAnimationGroup")
}
    
    //투명해지기
//    func shakeAnimation(imageView: UIImageView) {
//
//        let animation = CABasicAnimation(keyPath: "opacity")
//        animation.fromValue = 1.0 // 완전 불투명
//        animation.toValue = 0.0 // 완전 투명
//        animation.duration = 3 // 1초 동안
//        imageView.layer.add(animation, forKey: "opacity")
//
//    }
//
    //빙글빙글
//    func shakeAnimation(imageView: UIImageView) {
//
//    let animation = CABasicAnimation(keyPath: "transform.rotation")
//    animation.fromValue = 0 // 시작 각도
//    animation.toValue = Double.pi * 200 // 360도 회전
//    animation.duration = 50 // 1초 동안
//            imageView.layer.add(animation, forKey: "rotation")
//}
    
    // 이미지 커지기
//    func shakeAnimation(imageView: UIImageView) {
//
//        let animation = CABasicAnimation(keyPath: "transform.scale")
//        animation.fromValue = 1.0 // 원래 크기
//        animation.toValue = 10.0 // 2배로 확대
//        animation.duration = 10 // 1초 동안
//        imageView.layer.add(animation, forKey: "scale")
//    }
    
    // 이미지 흔들기
//    func shakeAnimation(imageView: UIImageView) {
//        let animation = CABasicAnimation(keyPath: "position")
//        animation.duration = 0.1
//        animation.repeatCount = 40
//        animation.autoreverses = true
//        animation.fromValue = NSValue(cgPoint: CGPoint(x: imageView.center.x - 30, y: imageView.center.y))
//        animation.toValue = NSValue(cgPoint: CGPoint(x: imageView.center.x + 30, y: imageView.center.y))
//        imageView.layer.add(animation, forKey: "position")
//    }

    
    @objc func yourSelector1() {

    }

    @objc func yourSelector2() {
        // 두번째 버튼이 눌렸을 때의 동작을 정의
    }



}


