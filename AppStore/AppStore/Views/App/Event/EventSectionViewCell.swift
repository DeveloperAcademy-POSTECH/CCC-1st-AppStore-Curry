//
//  EventSectionViewCell.swift
//  AppStore
//
//  Created by 이재웅 on 2022/06/28.
//

import UIKit
import SnapKit

final class EventSectionViewCell: UICollectionViewCell {
    private lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12.0
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = 0.1
        view.layer.masksToBounds = false
       
        return view
    }()
    
    private lazy var eventStateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .systemBlue
        
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
    
    private lazy var eventTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6.0
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        
        return label
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
    
    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.layer.cornerRadius = 12.0

        return effectView
    }()
    
    func setup() {
        setupLayout()
        
        eventStateLabel.text = "현재 진행 중"
        eventTypeLabel.text = "특별 이벤트"
        titleLabel.text = "돈 버는 해외여행, 트리플 노마드"
        descriptionLabel.text = "주급 490만원과 해외 항공권을 드립니다!"
        appNameLabel.text = "트리플 - 최저가 예약부터 여행계획까지"
        appDescriptionLabel.text = "항공권, 호텔, 맛집, 관광지, 여행계획"
        
        imageView.image = UIImage(named: "EventSectionViewCellImage")
        appImageView.image = UIImage(named: "EventSectionViewCellAppImage")
    }
}

extension EventSectionViewCell {
    private func setupLayout() {
        [
            eventStateLabel,
            containerView
        ].forEach { addSubview($0) }
        
        [
            imageView,
            blurView,
            eventTypeLabel,
            titleLabel,
            descriptionLabel,
            appImageView,
            appNameLabel,
            appDescriptionLabel,
            downloadButton
        ].forEach { containerView.addSubview($0) }
        
        eventStateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(eventStateLabel.snp.bottom).offset(12.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(eventStateLabel.snp.bottom)
            $0.width.equalTo(350.0)
            $0.height.equalTo(226.0)
            $0.centerX.equalTo(snp.centerX)
        }
        
        eventTypeLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading).inset(15.0)
            $0.top.equalTo(imageView.snp.top).inset(150.0)
            $0.trailing.equalTo(imageView.snp.trailing)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(eventTypeLabel.snp.leading)
            $0.trailing.equalTo(eventTypeLabel.snp.trailing)
            $0.top.equalTo(eventTypeLabel.snp.bottom).offset(4.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(eventTypeLabel.snp.leading)
            $0.trailing.equalTo(eventTypeLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
        }
        
        appImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15.0)
            $0.top.equalTo(imageView.snp.bottom).offset(15.0)
            $0.bottom.equalToSuperview().inset(15.0)
            $0.width.height.equalTo(36.0)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalTo(appImageView.snp.top)
            $0.leading.equalTo(appImageView.snp.trailing).offset(8.0)
            $0.width.equalTo(203.0)
        }
        
        appDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(appNameLabel.snp.leading)
            $0.top.equalTo(appNameLabel.snp.bottom).offset(4.0)
            $0.width.equalTo(203.0)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14.0)
            $0.centerY.equalTo(appImageView.snp.centerY)
            $0.width.equalTo(71.0)
            $0.height.equalTo(27.0)
        }
        
        blurView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading)
            $0.trailing.equalTo(imageView.snp.trailing)
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.top.equalTo(eventTypeLabel.snp.top)
        }
    }
}

