//
//  TopView.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import UIKit

class TopNavigationView: UIView {
    
    private let avatarImage: UIImageView = {
        let iv = UIImageView(frame: .zero)
        
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
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    
    
}
