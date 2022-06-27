//
//  RecommendSectionView.swift
//  AppStore
//
//  Created by 이재웅 on 2022/06/26.
//

import UIKit
import SnapKit

final class RecommendSectionView: UIView {
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(
            RecommendSectionViewCell.self,
            forCellWithReuseIdentifier: "RecommendSectionViewCell"
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

extension RecommendSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendSectionViewCell", for: indexPath) as? RecommendSectionViewCell
        
        cell?.setup()
        
        return cell ?? UICollectionViewCell()
    }
    
}

extension RecommendSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 40.0, height: (frame.width / 7) * 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10.0
    }
}

extension RecommendSectionView {
    func setupView() {
        [
            separatorView,
            collectionView
        ].forEach { addSubview($0) }
        
        separatorView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(0.5)
        }

        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(separatorView.snp.bottom)
            $0.height.equalTo(350.0)
            $0.bottom.equalToSuperview()
        }
    }
}
