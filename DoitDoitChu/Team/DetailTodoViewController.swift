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
    
    
    @IBOutlet weak var firstUserVIew: UIView!
    @IBOutlet weak var firstTaskDo: UILabel!
    @IBOutlet weak var firstnickname: UILabel!
    @IBOutlet weak var fitstTaskCheck: UIImageView!
    
    @IBOutlet weak var SecondUserVIew: UIView!
    @IBOutlet weak var SecondTaskDo: UILabel!
    @IBOutlet weak var Secondnickname: UILabel!
    @IBOutlet weak var SecondTaskCheck: UIImageView!
    
    @IBOutlet weak var ThirdUserVIew: UIView!
    @IBOutlet weak var ThirdTaskDo: UILabel!
    @IBOutlet weak var Thirdnickname: UILabel!
    @IBOutlet weak var ThirdTaskCheck: UIImageView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    var firstUser: TeamUser?
    var secondUser: TeamUser?
    var thirdUser: TeamUser?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        TodayView.layer.cornerRadius = 12
        TeamWork.layer.cornerRadius = 12
       
        AF.request("https://port-0-doit-backend-das6e2dlig0er28.sel4.cloudtype.app/detail/4/1", method: .get, parameters: nil, encoding: JSONEncoding.default)
                    .responseDecodable(of: Response.self) { response in
                        switch response.result {
                        case .success(let todoData):
                            DispatchQueue.main.async {
                                self.TeamTaskLabel.text = todoData.recommendTodo
                                self.firstUser = todoData.teamUserDataList[safe: 0]
                                if let firstUser = self.firstUser {
                                    self.updateView(user: firstUser, nicknameLabel: self.firstnickname, taskCheckImageView: self.fitstTaskCheck, taskDoLabel: self.firstTaskDo)
                                }
                                
                                self.secondUser = todoData.teamUserDataList[safe: 1]
                                if let secondUser = self.secondUser {
                                    self.updateView(user: secondUser, nicknameLabel: self.Secondnickname, taskCheckImageView: self.SecondTaskCheck, taskDoLabel: self.SecondTaskDo)
                                }
                                
                                self.thirdUser = todoData.teamUserDataList[safe: 2]
                                if let thirdUser = self.thirdUser {
                                    self.updateView(user: thirdUser, nicknameLabel: self.Thirdnickname, taskCheckImageView: self.ThirdTaskCheck, taskDoLabel: self.ThirdTaskDo)
                                }

                                // Update doneButton color if all tasks are done
                                if self.firstUser?.checked == true && self.secondUser?.checked == true && self.thirdUser?.checked == true {
                                    self.doneButton.backgroundColor = UIColor.green // Or your desired color
                                } else {
                                    self.doneButton.backgroundColor = UIColor.gray // Or your desired color
                                }
                            }
                        case .failure(_):
                            print("Request failed")
                        }
                    }

    }
    func updateView(user: TeamUser, nicknameLabel: UILabel, taskCheckImageView: UIImageView, taskDoLabel: UILabel) {
        nicknameLabel.text = user.nickname
        taskDoLabel.text = user.checked ? "완료했어요" : "하는중이에요"
        taskCheckImageView.image = UIImage(named: user.checked ? "DoneBell" : "Doing")
            
        if user.checked {
            taskDoLabel.textColor = UIColor(red: 1, green: 0.498, blue: 0, alpha: 1)
        } else {
            taskDoLabel.textColor = UIColor(red: 0.467, green: 0.467, blue: 0.467, alpha: 1)
        }
            
        taskDoLabel.font = UIFont(name: "Pretendard-Medium", size: 14)
            
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
        taskCheckImageView.isUserInteractionEnabled = true
        taskCheckImageView.addGestureRecognizer(tapGestureRecognizer)

        // Check all user's task and update doneButton color
        if self.firstUser?.checked == true && self.secondUser?.checked == true && self.thirdUser?.checked == true {
            self.doneButton.backgroundColor = UIColor(red: 1, green: 0.898, blue: 0.8, alpha: 1)
        } else {
            self.doneButton.backgroundColor = UIColor.black // Or your desired color
        }
    }

    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if tappedImage == fitstTaskCheck {
            firstUser?.checked.toggle()
            updateView(user: firstUser!, nicknameLabel: firstnickname, taskCheckImageView: fitstTaskCheck, taskDoLabel: firstTaskDo)
        } else if tappedImage == SecondTaskCheck {
            secondUser?.checked.toggle()
            updateView(user: secondUser!, nicknameLabel: Secondnickname, taskCheckImageView: SecondTaskCheck, taskDoLabel: SecondTaskDo)
        } else if tappedImage == ThirdTaskCheck {
            thirdUser?.checked.toggle()
            updateView(user: thirdUser!, nicknameLabel: Thirdnickname, taskCheckImageView: ThirdTaskCheck, taskDoLabel: ThirdTaskDo)
        }
        
        // Check all user's task and update doneButton color
        if self.firstUser?.checked == true && self.secondUser?.checked == true && self.thirdUser?.checked == true {
            self.doneButton.backgroundColor = UIColor.green // Or your desired color
        } else {
            self.doneButton.backgroundColor = UIColor.gray // Or your desired color
        }
    }

        
    }


extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}






