//
//  characterViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/05.
//

import UIKit
import Alamofire


class characterViewController: UIViewController {

    @IBOutlet weak var backImage: UIImageView!
    
    
    @IBOutlet weak var TodoView: UIView!
    
    @IBOutlet weak var TodoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItems()

        TodoView.layer.cornerRadius = 12
        
        // Alamofire를 사용해서 서버에서 데이터를 가져오는 코드
           let url = "https://port-0-doit-backend-das6e2dlig0er28.sel4.cloudtype.app/teamTodo/4"
           
        AF.request(url).responseDecodable(of: TeamTodoResponse.self) { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.TodoLabel.text = data.teamInfoList.first?.recommendTodo
                }
            case .failure(let error):
                print(error)
            }
        }

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
    
    @IBAction func GoTodoBtn(_ sender: Any) {
        print("13")
    }
    
  
    
    @objc func yourSelector1() {

    }

    @objc func yourSelector2() {
        // 두번째 버튼이 눌렸을 때의 동작을 정의
    }


    
}
