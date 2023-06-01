//
//  SoloTodoTableViewCell.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/05/31.
//

import UIKit

class SoloTodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkBtn: UIImageView!
    
    @IBOutlet weak var TodoLabel: UILabel!
    
    @IBOutlet weak var moreBtn: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
