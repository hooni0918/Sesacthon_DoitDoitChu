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
        // NewTodoWrite의 내용이 비어있지 않다면
        if let newTodo = NewTodoWrite.text, !newTodo.isEmpty {
            // parentVC의 todos 배열에 추가하고
            parentVC?.todos.append(newTodo)
            // WriteTodoViewController의 todos 배열에도 추가
            todos.append(newTodo)
            // UITableView를 갱신합니다.
            parentVC?.mainTable.reloadData()
            // WriteTodoViewController의 newTodoTable도 갱신
            newTodoTable.reloadData()
        }
        // 이 화면을 닫습니다.
        self.dismiss(animated: true, completion: nil)
    }

    
}

extension WriteTodoViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListTestTableViewCell", for: indexPath) as? CheckListTestTableViewCell else {
            fatalError("The dequeued cell is not an instance of CheckListTestTableViewCell.")
            
        }
        
        
        cell.TodoListLabel?.text = todos[indexPath.row]
        
        return cell
        
    }
    
}
