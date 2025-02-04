//
//  TeamTodoVC.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/05/31.
//

import UIKit

class TeamTodoVC: UIViewController {

    @IBOutlet weak var checterView: UIView!
    
    @IBOutlet weak var todoView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        navigationItems()
        checterView.layer.cornerRadius = 12
        todoView.layer.cornerRadius = 12
        
            }
    
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
    
    @objc func yourSelector1() {

    }

    @objc func yourSelector2() {
        // 두번째 버튼이 눌렸을 때의 동작을 정의
    }



}


