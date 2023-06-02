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
        
        mainTable.delegate = self
        mainTable.dataSource = self
     
        let nib = UINib(nibName: "CheckListTestTableViewCell", bundle: nil)
            mainTable.register(nib, forCellReuseIdentifier: "CheckListTestTableViewCell")
        }
    


}

extension SoloCheckViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListTestTableViewCell", for: indexPath) as? CheckListTestTableViewCell else {
            fatalError("The dequeued cell is not an instance of CheckListTestTableViewCell.")
        }
        
        return cell
    }
}


