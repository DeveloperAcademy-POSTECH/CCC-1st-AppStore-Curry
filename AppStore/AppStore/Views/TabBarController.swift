//
//  TabBarController.swift
//  AppStore
//
//  Created by 이재웅 on 2022/06/26.
//

import UIKit

class TabBarController: UITabBarController {

    private lazy var appViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: AppViewController())
        let tabBarItem = UITabBarItem(
            title: "앱",
            image: UIImage(systemName: "doc.text.image"),
            tag: 3
        )
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var todayViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(
            title: "투데이",
            image: UIImage(systemName: "square.3.stack.3d"),
            tag: 1
        )
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var gameViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(
            title: "게임",
            image: UIImage(systemName: "airplane.departure"),
            tag: 2
        )
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var arcadeViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(
            title: "Arcade",
            image: UIImage(systemName: "gamecontroller"),
            tag: 4
        )
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var searchViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(
            title: "검색",
            image: UIImage(systemName: "magnifyingglass"),
            tag: 5
        )
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            todayViewController,
            gameViewController,
            appViewController,
            arcadeViewController,
            searchViewController
        ]
    }
}
