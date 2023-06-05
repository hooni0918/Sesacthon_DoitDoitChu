//
//  HistoryViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/05/31.
//
//
//  HistoryViewController.swift
//  DoitDoitChu
//
//  Created by 이지훈 on 2023/05/31.
//

import UIKit

class HistoryVC: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    @IBOutlet weak var segmentedControl: UnderlineSegmentedControl!
    
    var pageViewController: UIPageViewController!
    var viewControllerList: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItems()
        
        // ViewControllers 초기화
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let selectCharacterVC = storyboard.instantiateViewController(withIdentifier: "SelectCharaterViewController")
        let myTodoVC = storyboard.instantiateViewController(withIdentifier: "MyTodoViewController")
        viewControllerList.append(selectCharacterVC)
        viewControllerList.append(myTodoVC)
        
        // PageViewController 설정
        setupPageViewController()
        
        // SegmentedControl 설정
        setupSegmentedControl()
    }
    
    private func setupPageViewController() {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        
        if let firstViewController = viewControllerList.first {
            self.pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        self.addChild(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParent: self)
        
        self.pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.pageViewController.view.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor), // 수정된 부분
            self.pageViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.pageViewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.pageViewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }

    private func setupSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllerList.firstIndex(of: viewController), index > 0 else {
            return nil
        }
        
        let previousIndex = index - 1
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllerList.firstIndex(of: viewController), index < (viewControllerList.count - 1) else {
            return nil
        }
        
        let nextIndex = index + 1
        return viewControllerList[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let currentViewController = pageViewController.viewControllers?.first,
              let index = viewControllerList.firstIndex(of: currentViewController) else {
            return
        }
        
        segmentedControl.selectedSegmentIndex = index
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let direction: UIPageViewController.NavigationDirection = segmentedControl.selectedSegmentIndex > index ? .reverse : .forward
        
        pageViewController.setViewControllers([viewControllerList[index]], direction: direction, animated: true)
    }
    
    
    
    private func navigationItems() {
        // 왼쪽 아이템 설정
        let leftLabel = UILabel()
        leftLabel.text = "나의 성과"
        leftLabel.font = UIFont(name: "Pretendard-Bold", size: 18)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftLabel)
        
        // 오른쪽 아이템 설정
        let rightImage1 = UIImage(named: "BellSimple")
        let rightButton1 = UIButton(type: .custom)
        rightButton1.setImage(rightImage1, for: .normal)
        rightButton1.addTarget(self, action: #selector(yourSelector1), for: .touchUpInside)
        
        let rightImage2 = UIImage(named: "UserCircle")
        let rightButton2 = UIButton(type: .custom)
        rightButton2.setImage(rightImage2, for: .normal)
        rightButton2.addTarget(self, action: #selector(yourSelector2), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: rightButton1), UIBarButtonItem(customView: rightButton2)]
        
    }
    
    @objc func yourSelector1() {
        
    }
    
    @objc func yourSelector2() {
        // 두번째 버튼이 눌렸을 때의 동작을 정의
    }
    
}



final class UnderlineSegmentedControl: UISegmentedControl {
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        addSubview(view)
        return view
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.removeBackgroundAndDivider()
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 13, weight: .semibold)], for: .selected)
        
        self.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    private func removeBackgroundAndDivider() {
        let image = UIImage()
        self.setBackgroundImage(image, for: .normal, barMetrics: .default)
        self.setBackgroundImage(image, for: .selected, barMetrics: .default)
        self.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
        
        self.setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height = CGFloat(2.0)
        let yPosition = self.bounds.size.height - height
        underlineView.frame = CGRect(x: underlineView.frame.origin.x, y: yPosition, width: self.bounds.width / CGFloat(self.numberOfSegments), height: height)
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = underlineFinalXPosition
        }
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        self.selectedSegmentIndex = 0
    }
    
}

