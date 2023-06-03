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
    
    @IBOutlet weak var writeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainVIew.layer.cornerRadius = 12
        
        mainTable.delegate = self
        mainTable.dataSource = self
     
        let nib = UINib(nibName: "CheckListTestTableViewCell", bundle: nil)
            mainTable.register(nib, forCellReuseIdentifier: "CheckListTestTableViewCell")
        
        writeImage.isUserInteractionEnabled = true
        
        let tabGestureRecongnize = UITapGestureRecognizer(target: self, action:  #selector(presentModal))
        writeImage.addGestureRecognizer(tabGestureRecongnize)
        }
    
    
//    @objc func presentModal() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailViewController = WriteTodoViewController()
//        let nav = UINavigationController(rootViewController: detailViewController)
//        // 1
//        nav.modalPresentationStyle = .pageSheet
//
//
//        // 2
//        if let sheet = nav.sheetPresentationController {
//
//            // 3
//            sheet.detents = [.medium(), .large()]
//
//        }
//        // 4
//        present(nav, animated: true, completion: nil)
//
//    }
    
    @objc func presentModal() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let writeTodoViewController = storyboard.instantiateViewController(withIdentifier: "WriteTodoViewController") as? WriteTodoViewController {
            
            writeTodoViewController.parentVC = self  // <-- parentVC 설정

            let navigationController = UINavigationController(rootViewController: writeTodoViewController)
            navigationController.modalPresentationStyle = .pageSheet
            
            if let sheet = navigationController.sheetPresentationController {
                sheet.detents = [.large()]
            }
            
            present(navigationController, animated: true, completion: nil)
        } else {
            print("WriteTodoViewController를 찾을 수 없습니다.")
        }
    }

    
//
//    @objc func writeImageTapped() {
//           let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//           let newViewController = storyBoard.instantiateViewController(withIdentifier: "WriteTodoViewController")
//           self.present(newViewController, animated: true, completion: nil)
//       }
//
    
    
    
    

}

extension SoloCheckViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.shared.todos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListTestTableViewCell", for: indexPath) as? CheckListTestTableViewCell else {
                fatalError("The dequeued cell is not an instance of CheckListTestTableViewCell.")
            }
            
            cell.TodoListLabel.text = TodoManager.shared.todos[indexPath.row]
            
        
      
        cell.TodoListLabel.text = TodoManager.shared.todos[indexPath.row]

        cell.buttonAction = {
            
            
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let deleteAction = UIAlertAction(title: "삭제하기", style: .destructive, handler: { (action) in
                // handle delete
            })
            
            let editAction = UIAlertAction(title: "수정하기", style: .default, handler: { (action) in
                // handle edit
            })
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            alertController.addAction(editAction)
            alertController.addAction(deleteAction)

            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        return cell
    }
}
