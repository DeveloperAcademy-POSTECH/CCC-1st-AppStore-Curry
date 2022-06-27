//
//  RankingSectionView.swift
//  AppStore
//
//  Created by 이재웅 on 2022/06/27.
//

import UIKit
import SnapKit

final class RankingSectionView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .semibold)
        label.text = "무료 앱 순위"
        
        return label
    }()
    
    private lazy var showAllAppsButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0)
        
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(
            RankingSectionViewCell.self,
            forCellWithReuseIdentifier: "RankingSectionViewCell"
        )
        
        return collectionView
    }()
    
    private let separatorView = SeparatorView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RankingSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankingSectionViewCell", for: indexPath) as? RankingSectionViewCell
        
        cell?.setup(indexPath: indexPath)
        
        return cell ?? UICollectionViewCell()
    }
}

extension RankingSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: collectionView.frame.width - 40.0, height: RankingSectionViewCell.height)
    }
}

extension RankingSectionView {
    func setupView() {
        [
            separatorView,
            titleLabel,
            showAllAppsButton,
            collectionView
        ].forEach { addSubview($0) }
        
        separatorView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(16.0)
            $0.height.equalTo(0.5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(separatorView.snp.leading).inset(20.0)
            $0.top.equalTo(separatorView.snp.bottom).offset(12.0)
        }
        
        showAllAppsButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalTo(titleLabel.snp.bottom)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            $0.height.equalTo(RankingSectionViewCell.height * 3)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
    }
}
