//
//  RecommendSectionViewCell.swift
//  AppStore
//
//  Created by 이재웅 on 2022/06/26.
//

import UIKit
import SnapKit

final class RecommendSectionViewCell: UICollectionViewCell {
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0)
        label.textColor = .systemBlue
        
        return label
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28.0)
        
        return label
    }()
    
    private lazy var appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28.0)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 7.0
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6.0
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var appSimpleNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .systemBackground
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var appSimpleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0)
        label.textColor = .systemGray3
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12.0
        button.layer.opacity = 0.9
        
        return button
    }()
    
    private lazy var inAppPurchaseInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 8.0)
        label.textColor = .systemGray3
        
        return label
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.layer.cornerRadius = 12.0

        return effectView
    }()
    
    func setup() {
        let appName = "스푼: 오디오 라이브 방송"
        
        setupLayout()
        
        typeLabel.text = "다시 발견하기"
        appNameLabel.text = appName
        appDescriptionLabel.text = "음악과 대화로 소통해보세요"
        appSimpleNameLabel.text = appName
        appSimpleDescriptionLabel.text = "카메라 없이 목소리로 방송하는 오디오플렛폼!"
        
        imageView.image = UIImage(named: "RecoomendSectionViewCellImage")
        appImageView.image = UIImage(named: "RecoomendSectionViewCellAppImage")
    }
}

extension RecommendSectionViewCell {
    private func setupLayout() {
        [
            typeLabel,
            appNameLabel,
            appDescriptionLabel,
            imageView,
            blurView,
            appImageView,
            appSimpleNameLabel,
            appSimpleDescriptionLabel,
            downloadButton,
            inAppPurchaseInfoLabel
        ].forEach { addSubview($0) }
        
        typeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        appNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(typeLabel.snp.bottom)
        }
        
        appDescriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(appNameLabel.snp.bottom)
        }
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(350.0)
            $0.height.equalTo(226.0)
            $0.centerX.equalTo(snp.centerX)
            $0.top.equalTo(appDescriptionLabel.snp.bottom).offset(12.0)
            $0.bottom.equalToSuperview()
        }
        
        appImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(13.0)
            $0.bottom.equalToSuperview().inset(15.0)
            $0.width.height.equalTo(36.0)
        }
        
        appSimpleNameLabel.snp.makeConstraints {
            $0.leading.equalTo(appImageView.snp.trailing).offset(8.0)
            $0.width.equalTo(203.0)
            $0.top.equalTo(appImageView.snp.top)
        }
        
        appSimpleDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(appSimpleNameLabel.snp.leading)
            $0.width.equalTo(203.0)
            $0.top.equalTo(appSimpleNameLabel.snp.bottom).offset(4.0)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14.0)
            $0.centerY.equalTo(appImageView.snp.centerY)
            $0.width.equalTo(71.0)
            $0.height.equalTo(27.0)
        }
        
        inAppPurchaseInfoLabel.snp.makeConstraints {
            $0.centerX.equalTo(downloadButton.snp.centerX)
            $0.top.equalTo(downloadButton.snp.bottom).offset(4.0)
        }
        
        blurView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading)
            $0.trailing.equalTo(imageView.snp.trailing)
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.top.equalTo(appImageView.snp.top)
        }
    }
}
