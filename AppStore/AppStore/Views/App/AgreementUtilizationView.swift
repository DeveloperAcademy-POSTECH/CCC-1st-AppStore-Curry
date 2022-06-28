//
//  AgreementUtilizationView.swift
//  AppStore
//
//  Created by 이재웅 on 2022/06/28.
//

import UIKit
import SnapKit

final class AgreementUtilizationView: UIView {
    private let spacingTopView = UIView()
    private let spacingBottomView = UIView()
    private let separatorView = SeparatorView(frame: .zero)
    
    private lazy var agreementUtilizationLabel: UILabel = {
        let label = UILabel()
        label.text = "이용 약관 >"
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AgreementUtilizationView {
    private func setupView() {
        [
            spacingTopView,
            separatorView,
            agreementUtilizationLabel,
            spacingBottomView
        ].forEach { addSubview($0) }
        
        spacingTopView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(20.0)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(spacingTopView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
        agreementUtilizationLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(12.0)
            $0.leading.equalTo(separatorView).offset(16.0)
            $0.trailing.equalToSuperview()
        }
        
        spacingBottomView.snp.makeConstraints {
            $0.top.equalTo(agreementUtilizationLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
}
