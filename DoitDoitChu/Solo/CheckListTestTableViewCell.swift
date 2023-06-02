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
    
    
    var isChecked = false
    var buttonAction: (() -> Void)? // 버튼클릭햇을때 액션시트 호출할거

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 버튼에 함수 할당
        meatBallButton.addTarget(self, action: #selector(meatBallButtonTapped), for: .touchUpInside)
    
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                checkImage.isUserInteractionEnabled = true
                checkImage.addGestureRecognizer(tapGestureRecognizer)
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
