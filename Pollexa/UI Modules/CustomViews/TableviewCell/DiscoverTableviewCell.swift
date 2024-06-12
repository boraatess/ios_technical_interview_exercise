//
//  DiscoverTableviewCell.swift
//  Pollexa
//
//  Created by bora ateş on 11.06.2024.
//

import UIKit
import SnapKit

protocol discoverCellOutputDelegate: AnyObject {
    func leftButtonsendUserID(with id: String)
    func rightButtonsendUserID(with id: String)
}

class DiscoverTableviewCell: UITableViewCell {
    
    private let cardView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatarIV: RoundedImageView = {
        let iv = RoundedImageView(frame: .zero)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = .zero
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = .zero
        label.textAlignment = .right
        return label
    }()
    
    private let splitView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = .zero
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let post1: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
    private let post2: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
    private lazy var voteOptions: VoteOptionsView = {
        let view = VoteOptionsView()
        view.output = self
        return view
    }()
    
    private let totalVoteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 14)
        label.text = "0 total votes"
        return label
    }()
    
    var userid: String = ""
    var totalVotes: Int = 0
    
    weak var output: discoverCellOutputDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func refreshCell(with post: Post) {
        avatarIV.image = post.user.image
        userName.text = post.user.username
        let dateString = Utils.shared.calculateTimeDifference(from: post.createdAt)
        dateLabel.text = dateString
        titleLabel.text = "Last voted 1 hour ago"
        contentLabel.text = post.content
        let post1image = post.options[0].image
        let post2image = post.options[1].image
        post1.image = post1image
        post2.image = post2image
        
        totalVoteLabel.text = "\(self.totalVotes) total votes"
        
        voteOptions.setBackgroundimage(with: post1image, and: post2image)
        userid = post.user.id
        
    }
    
    func updateTotalVotes(with totalVotes: String) {
        totalVoteLabel.text = "\(totalVotes) total votes"
    }
    
    func setPercentageText(optionA: String, optionB: String ) {
        voteOptions.setPercentLabelTexts(with: "\(optionA)%", and: "\(optionB)%")
    }
    
    func refreshVoteView(with canVote: Bool) {
        
        if canVote {
            voteOptions.setHiddenLabels()
        }
        else {
            voteOptions.setHiddenButtons()
        }
        
    }
    
    func layout() {
        
        contentView.addSubview(cardView)
        cardView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
        }
        
        cardView.addSubview(avatarIV)
        avatarIV.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(32)
            make.height.equalTo(32)
            
        }
        
        cardView.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(self.avatarIV.snp.trailing).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        cardView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.width.equalTo(120)
            make.height.equalTo(20)
        }
        
        cardView.addSubview(splitView)
        splitView.snp.makeConstraints { make in
            make.top.equalTo(self.avatarIV.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(2)
        }
        
        cardView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.splitView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
            make.height.equalTo(15)
        }
        
        cardView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
        }
             
        cardView.addSubview(voteOptions)
        voteOptions.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(200)
            
        }
        
        cardView.addSubview(totalVoteLabel)
        totalVoteLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()

        }
        
    }
        
}


extension DiscoverTableviewCell: VoteOptionsOutputDelegate {
    
    func voteLeftButtonAction() {
        output?.leftButtonsendUserID(with: self.userid)
    }
    
    func voteRightButtonAction() {
        output?.rightButtonsendUserID(with: self.userid)
    }
    
    
}
