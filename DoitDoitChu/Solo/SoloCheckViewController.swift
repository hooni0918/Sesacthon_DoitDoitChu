//
//  SlloTodoViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/05/31.
//

import UIKit

class SoloCheckViewController: UIViewController {

    @IBOutlet weak var mainVIew: UIView!
    
    @IBOutlet weak var mainTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainVIew.layer.cornerRadius = 12
        
    }
    


}

extension SoloCheckViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SoloTodoTableViewCell") as? SoloTodoTableViewCell else {
            // Create a new cell if there isn't one to reuse
            return SoloTodoTableViewCell()
        }
        
        return cell
    }
}


