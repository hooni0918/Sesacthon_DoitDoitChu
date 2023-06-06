//
//  DetailTodoViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/06.
//

import UIKit

class DetailTodoViewController: UIViewController {

    @IBOutlet weak var TodayView: UIView!
    
    @IBOutlet weak var TeamWork: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        TodayView.layer.cornerRadius = 12
        TeamWork.layer.cornerRadius = 12
    }
    

    

}
