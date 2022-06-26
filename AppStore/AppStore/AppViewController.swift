//
//  AppViewController.swift
//  AppStore
//
//  Created by 이재웅 on 2022/06/26.
//

import UIKit
import SnapKit

class AppViewController: UIViewController {
    
    private lazy var infomationButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: nil)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationController()
    }
    
}

extension AppViewController {
    private func setUpNavigationController() {
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.barPosition = .
        
        navigationItem.rightBarButtonItem = infomationButton
    }
    
}
