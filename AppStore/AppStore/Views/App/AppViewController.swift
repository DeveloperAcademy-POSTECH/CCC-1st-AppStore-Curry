//
//  AppViewController.swift
//  AppStore
//
//  Created by 이재웅 on 2022/06/26.
//

import UIKit
import SnapKit

class AppViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let recommendSectionView = RecommendSectionView(frame: .zero)
        let rankingSectionView = RankingSectionView(frame: .zero)
        let eventSectionView = EventSectionView(frame: .zero)
        let exchangeCodeButtonView = ExchangeCodeButtonView(frame: .zero)
        let agreementUtilizationView = AgreementUtilizationView(frame: .zero)
        
        [
            recommendSectionView,
            rankingSectionView,
            eventSectionView,
            exchangeCodeButtonView,
            agreementUtilizationView
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var infomationButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: nil)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationController()
        setupLayout()
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
    
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(scrollView.contentLayoutGuide.snp.height)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
}
