//
//  WriteTodoViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/06/02.
//

import UIKit

class TodoManager {
    static let shared = TodoManager()

    private init() {}

    var todos: [String] = []
}



class WriteTodoViewController: UIViewController {
  

    @IBOutlet weak var NewTodoWrite: UITextField!
    
    @IBOutlet weak var newTodoTable: UITableView!
    
    var todos: [String] = []

    
    weak var parentVC: SoloCheckViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CheckListTestTableViewCell", bundle: nil)
        newTodoTable.register(nib, forCellReuseIdentifier: "CheckListTestTableViewCell")


        
        newTodoTable.dataSource = self
        newTodoTable.delegate = self
        
        navigationItems()
        
        NewTodoWrite.layer.cornerRadius = 12
        
    }
    
    private func navigationItems() {
        let leftImage = UIImage(named: "close")
        let leftImageView = UIImageView(image: leftImage)
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftImageView.widthAnchor.constraint(equalToConstant: 24),
            leftImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        let leftBarButton = UIBarButtonItem(customView: leftImageView)
        let leftButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(yourSelector1))
        leftImageView.addGestureRecognizer(leftButtonTapGesture)

        self.navigationItem.leftBarButtonItem = leftBarButton

        let rightImage1 = UIImage(named: "done")
        let rightImageView1 = UIImageView(image: rightImage1)
        rightImageView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightImageView1.widthAnchor.constraint(equalToConstant: 32),
            rightImageView1.heightAnchor.constraint(equalToConstant: 24)
        ])
        let rightBarButton1 = UIBarButtonItem(customView: rightImageView1)
        let rightButtonTapGesture1 = UITapGestureRecognizer(target: self, action: #selector(yourSelector2))
        rightImageView1.addGestureRecognizer(rightButtonTapGesture1)

        self.navigationItem.rightBarButtonItem = rightBarButton1
    }

    
    @objc func yourSelector1() {
        self.dismiss(animated: true, completion: nil)


        
    }
    @objc func yourSelector2() {
        if let newTodo = NewTodoWrite.text, !newTodo.isEmpty {
            TodoManager.shared.todos.append(newTodo)
            newTodoTable.reloadData()
        }

        // dismiss 후에 실행되는 클로저를 추가합니다.
        self.dismiss(animated: true) {
            // SoloCheckViewController의 테이블 뷰를 다시 로드합니다.
            self.parentVC?.mainTable.reloadData()
        }
    }

    
}

extension WriteTodoViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.shared.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListTestTableViewCell", for: indexPath) as? CheckListTestTableViewCell else {
            fatalError("The dequeued cell is not an instance of CheckListTestTableViewCell.")
        }
        
        cell.TodoListLabel?.text = TodoManager.shared.todos[indexPath.row]
        
        return cell
    }
}
