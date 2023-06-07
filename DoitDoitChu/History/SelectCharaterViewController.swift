//
//  SelectCharaterViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/05.
//

import UIKit

class SelectCharaterViewController: UIViewController {
    
    
    @IBOutlet weak var DropAllBtn: UIButton!
    
    @IBOutlet weak var New: UIButton!
    
    @IBOutlet weak var allView: UIView!
    
    
    @IBOutlet weak var newView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuItem1 = UIAction(title: "전체") { action in
            print("전체 선택")
        }
        let menuItem2 = UIAction(title: "개인투두") { action in
            print("개인투두 선택")
        }
        let menuItem3 = UIAction(title: "팀투두") { action in
            print("팀투두 선택")
        }
        
        // 메뉴 생성
        let menu1 = UIMenu(title: "", children: [menuItem1, menuItem2, menuItem3])
        
        // 버튼에 메뉴 할당
        DropAllBtn.menu = menu1
        // 버튼 클릭시 메뉴가 나타나게 설정
        DropAllBtn.showsMenuAsPrimaryAction = true
        
        // New 버튼 메뉴 아이템 정의
        let menuItem4 = UIAction(title: "최신순") { action in
            print("최신순 선택")
        }
        let menuItem5 = UIAction(title: "오래된순") { action in
            print("오래된순 선택")
        }
        
        // 메뉴 생성
        let menu2 = UIMenu(title: "", children: [menuItem4, menuItem5])
        
        // 버튼에 메뉴 할당
        New.menu = menu2
        // 버튼 클릭시 메뉴가 나타나게 설정
        New.showsMenuAsPrimaryAction = true
        
        //        allView.layer.borderWidth = 2
        //        allView.layer.borderColor = UIColor(red: 0.58, green: 0.58, blue: 0.58, alpha: 1).cgColor
        
        allView.layer.borderWidth = 1
        allView .layer.cornerRadius = 20
        
        newView.layer.borderWidth = 1
        newView.layer.cornerRadius = 20
        
    }
}
