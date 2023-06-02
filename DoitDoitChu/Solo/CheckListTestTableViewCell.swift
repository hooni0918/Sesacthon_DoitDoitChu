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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
