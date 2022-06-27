//
//  RankingSectionViewCell.swift
//  AppStore
//
//  Created by 이재웅 on 2022/06/27.
//

import UIKit
import SnapKit

final class RankingSectionViewCell: UICollectionViewCell {
    static var height: CGFloat { 70.0 }
    
    private lazy var rankingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10.0
        imageView.layer.borderWidth = 0.1
        
        return imageView
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    func setup(indexPath: IndexPath) {
        setupView()
        
        rankingLabel.text = "\(indexPath.row + 1)"
        titleLabel.text = "쿠팡플레이"
        descriptionLabel.text = "와우회원을 위한 무제한 스트리밍 서비스"
        
        imageView.image = UIImage(named: "RankingSectionViewCellImage")
    }
}

extension RankingSectionViewCell {
    private func setupView() {
        [
            rankingLabel,
            titleLabel,
            descriptionLabel,
            imageView,
            downloadButton
        ].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(5.0)
            $0.bottom.equalToSuperview().inset(5.0)
            $0.width.equalTo(imageView.snp.height)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(27.0)
            $0.width.equalTo(71.0)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(8.0)
            $0.top.equalTo(imageView.snp.top)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(12.0)
            $0.top.equalTo(imageView.snp.top)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(downloadButton.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
        
        
    }
}
