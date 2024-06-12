//
//  VoteOptionsView.swift
//  Pollexa
//
//  Created by bora ateş on 12.06.2024.
//

import Foundation
import UIKit
import SnapKit

protocol VoteOptionsOutputDelegate: AnyObject {
    func voteLeftButtonAction()
    func voteRightButtonAction()
}

class VoteOptionsView: UIView {
    
    weak var output: VoteOptionsOutputDelegate?
    
    private let backgroundLeft: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let voteButtonLeft: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "voteUp"), for: .normal)
        button.isHidden = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let percentLabelLeft: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        label.isHidden = true
        label.textAlignment = .right
        return label
    }()
    
    private let backgroundRight: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let voteButtonRight: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "voteUp"), for: .normal)
        button.isHidden = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let percentLabelRight: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        label.isHidden = true
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
        voteButtonLeft.addTarget(self, action: #selector(voteLeftButtonTapped), for: .touchUpInside)
        voteButtonRight.addTarget(self, action: #selector(voteRightButtonTapped), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func voteLeftButtonTapped() {
        output?.voteLeftButtonAction()
    }
    
    @objc func voteRightButtonTapped() {
        output?.voteRightButtonAction()

    }
    
    func setHiddenButtons() {
        voteButtonLeft.isHidden = true
        voteButtonRight.isHidden = true
        percentLabelLeft.isHidden = false
        percentLabelRight.isHidden = false
        percentLabelLeft.text = "50%"
        percentLabelRight.text = "50%"
        
    }
    
    func setHiddenLabels() {
        percentLabelLeft.isHidden = true
        percentLabelRight.isHidden = true
        voteButtonLeft.isHidden = false
        voteButtonRight.isHidden = false
    }
    
    func setBackgroundimage(with image1: UIImage, and image2: UIImage) {
        backgroundLeft.image = image1
        backgroundRight.image = image2
        
    }
    
    func setPercentLabelTexts(with percentA: String, and percentB: String) {
        percentLabelLeft.text = percentA
        percentLabelRight.text = percentB
        
    }
    
    func layout() {
        addSubview(backgroundLeft)
        backgroundLeft.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
            make.width.equalTo(170)
            make.height.equalTo(150)
        }
        
        addSubview(voteButtonLeft)
        voteButtonLeft.snp.makeConstraints { make in
            make.top.equalTo(backgroundLeft.snp.bottom).offset(15)
            make.leading.equalTo(backgroundLeft.snp.leading).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.bottom.equalTo(backgroundLeft.snp.bottom).inset(5)
        }
        
        backgroundLeft.addSubview(percentLabelLeft)
        percentLabelLeft.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().inset(15)
        }
        
        addSubview(backgroundRight)
        backgroundRight.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(backgroundLeft.snp.trailing).offset(2)
            make.trailing.equalToSuperview().inset(5)
            make.height.equalTo(150)
        }
        
        addSubview(voteButtonRight)
        voteButtonRight.snp.makeConstraints { make in
            make.top.equalTo(backgroundRight.snp.bottom)
            make.leading.equalTo(backgroundRight.snp.leading).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.bottom.equalTo(backgroundRight.snp.bottom).inset(5)
            
        }
        
        backgroundRight.addSubview(percentLabelRight)
        percentLabelRight.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().inset(15)
            
        }
        
        
    }
    
}
