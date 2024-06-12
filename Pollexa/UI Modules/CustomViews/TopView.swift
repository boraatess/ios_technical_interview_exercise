//
//  TopView.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import UIKit
import SnapKit

class TopNavigationView: UIView {
    
    private let avatarImage: RoundedImageView = {
        let iv = RoundedImageView(frame: .zero)
        iv.image = UIImage(named: "avatar_1")
        return iv
    }()
    
    private let navTitle: UILabel = {
        let label = UILabel()
        label.text = "Discover"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "plusicon"), for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    
    func layout() {
        
        addSubview(avatarImage)
        avatarImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(34)
            make.height.equalTo(34)
        }
        
        addSubview(navTitle)
        navTitle.snp.makeConstraints { make in
            make.top.equalTo(self.avatarImage.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(140)
            make.height.equalTo(40)
        }
        
        addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
    }
    
}
