//
//  CheckListTestTableViewCell.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/01.
//

import UIKit

class CheckListTestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkImage: UIImageView!
    
    @IBOutlet weak var TodoListLabel: UILabel!
    
    
    @IBOutlet weak var moreImfo: UIImageView!
    
    @IBOutlet weak var meatBallButton: UIButton!
    
    
    // UITextField에 대한 사용자 인터랙션을 활성화하고, 처음에는 편집이 불가능하게 설정

    @IBOutlet weak var todoList: UITextField!{
    
   
            didSet {
                todoList.isUserInteractionEnabled = false
                todoList.delegate = self
            }
        }
    
    var isChecked = false
    var buttonAction: (() -> Void)? // 버튼클릭햇을때 액션시트 호출할거
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 버튼에 함수 할당
        meatBallButton?.addTarget(self, action: #selector(meatBallButtonTapped), for: .touchUpInside)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        checkImage?.isUserInteractionEnabled = true
        checkImage?.addGestureRecognizer(tapGestureRecognizer)
        
        
        todoList.isUserInteractionEnabled = true 

    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func meatBallButtonTapped() {
        buttonAction?()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        // 이미지 토글
        isChecked = !isChecked
        if isChecked {
            checkImage.image = UIImage(named: "unCheckSquare")
        } else {
            checkImage.image = UIImage(named: "CheckedSquare")
        }
    }
    
}

extension CheckListTestTableViewCell: UITextFieldDelegate {
    // Return 키를 누르면 편집이 종료되도록 설정
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // 편집이 종료되면 사용자 인터랙션을 비활성화
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isUserInteractionEnabled = false
    }
}
