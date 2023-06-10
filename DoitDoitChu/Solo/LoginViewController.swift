//
//  LoginViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/08.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailView: UITextField!
    
    @IBOutlet weak var pwView: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           emailView.delegate = self
           pwView.delegate = self
           
           pwView.isSecureTextEntry = true // 비밀번호가 보이지 않도록 설정
           
           loginBtn.isEnabled = false // 초기에 버튼
          // loginBtn.backgroundColor = UIColor.gray // 초기에 버튼 색상은 회색
        loginBtn.layer.cornerRadius = 12
       }
       
       func textFieldDidChangeSelection(_ textField: UITextField) {
           checkInput()
       }
       
       func checkInput() {
           if let email = emailView.text, let password = pwView.text {
               if email == "iden@naver.com" && password.count >= 6 {
                   loginBtn.isEnabled = true
                   loginBtn.backgroundColor = UIColor(red: 1, green: 0.498, blue: 0, alpha: 1)// 조건을 만족하면 버튼 색상은 주황색
               } else {
                   loginBtn.isEnabled = false
                   loginBtn.backgroundColor = UIColor(red: 0.875, green: 0.875, blue: 0.875, alpha: 1) // 조건을 만족하지 않으면 버튼 색상은 회색
               }
           }
       }
   }
 




