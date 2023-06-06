//
//  DetailTodoViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/06.
//

import UIKit
import Alamofire

class DetailTodoViewController: UIViewController {
    
    @IBOutlet weak var TodayView: UIView!
    
    @IBOutlet weak var TeamWork: UIView!
    
    @IBOutlet weak var TeamTaskLabel: UILabel!
    
    
    @IBOutlet weak var TaskDo: UILabel!
    
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var TaskCheck: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        TodayView.layer.cornerRadius = 12
        TeamWork.layer.cornerRadius = 12
        
        let url = "https://port-0-doit-backend-das6e2dlig0er28.sel4.cloudtype.app/detail/4/1"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseDecodable(of: Response.self) { response in
                switch response.result {
                case .success(let todoData):
                    self.TeamTaskLabel.text = todoData.recommendTodo
                    // Display the first user data as example
                    if let firstUser = todoData.teamUserDataList.first {
                        self.nickname.text = firstUser.nickname
                        // Set the image according to the 'checked' status
                        if firstUser.checked {
                            self.TaskCheck.image = UIImage(named: "Doing") // Name of the checked image in your assets
                        } else {
                            self.TaskCheck.image = UIImage(named: "DoneBell") // Name of the unchecked image in your assets
                        }
                    }
                    
                case .failure(let error):
                    print(error)
                }
                
                
            }
        
        
    }

    
    
    
}
    

    


 
