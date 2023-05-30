//
//  ViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/05/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var todoView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 왼쪽 아이템 설정
        let leftImage = UIImage(named: "Group 3") // 'your_image_name'을 실제 이미지 파일 이름으로 변경
        let leftImageView = UIImageView(image: leftImage)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftImageView)
        
        // 오른쪽 아이템 설정
        let rightImage1 = UIImage(named: "BellSimple") // 실제 이미지 파일 이름으로 변경
        let rightButton1 = UIButton(type: .custom)
        rightButton1.setImage(rightImage1, for: .normal)
        rightButton1.addTarget(self, action: #selector(yourSelector1), for: .touchUpInside)
        
        let rightImage2 = UIImage(named: "UserCircle") // 실제 이미지 파일 이름으로 변경
        let rightButton2 = UIButton(type: .custom)
        rightButton2.setImage(rightImage2, for: .normal)
        rightButton2.addTarget(self, action: #selector(yourSelector2), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: rightButton1), UIBarButtonItem(customView: rightButton2)]
        
        
        todoView.layer.cornerRadius = 12
        
    }

    @objc func yourSelector1() {
        // 첫번째 버튼이 눌렸을 때의 동작을 정의
    }

    @objc func yourSelector2() {
        // 두번째 버튼이 눌렸을 때의 동작을 정의
    }

    
    

}
