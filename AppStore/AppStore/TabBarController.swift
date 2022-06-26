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
            image: UIImage(systemName: "square.3.stack.3d"),
            tag: 1
        )
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [appViewController]
    }
}
