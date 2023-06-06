//
//  MyTodoViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/05.
//

import UIKit


class MyTodoViewController: UIViewController {

  
    @IBOutlet weak var DropAllBtn: UIButton!

    @IBOutlet weak var New: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 메뉴 아이템 정의
                let menuItem1 = UIAction(title: "피자") { action in
                    print("피자 선택")
                }
                let menuItem2 = UIAction(title: "치킨") { action in
                    print("치킨 선택")
                }
                let menuItem3 = UIAction(title: "족발보쌈") { action in
                    print("족발보쌈 선택")
                }
                let menuItem4 = UIAction(title: "치즈돈까스") { action in
                    print("치즈돈까스 선택")
                }
                let menuItem5 = UIAction(title: "햄버거") { action in
                    print("햄버거 선택")
                }
                
                // 메뉴 생성
                let menu = UIMenu(title: "", children: [menuItem1, menuItem2, menuItem3, menuItem4, menuItem5])
                
                // 버튼에 메뉴 할당
                DropAllBtn.menu = menu
                // 버튼 클릭시 메뉴가 나타나게 설정
                DropAllBtn.showsMenuAsPrimaryAction = true
        
        New.menu = menu
        New.showsMenuAsPrimaryAction = true
        
            }
    
    
    
}
