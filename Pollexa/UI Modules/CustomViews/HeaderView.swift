//
//  HeaderView.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    private let rectView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "AccentColor")
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "2 Active Polls"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.text = "See Details"
        label.textColor = .systemGray6
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let iconIV: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Icon")
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func layout() {
        
        addSubview(rectView)
        rectView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(15)
            make.bottom.trailing.equalToSuperview().inset(15)
        }
        
        rectView.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(140)
            make.height.equalTo(25)
        }
        
        rectView.addSubview(subTitle)
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(self.title.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(140)
            make.height.equalTo(25)
        }
        
        rectView.addSubview(iconIV)
        iconIV.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
    }
    
}
