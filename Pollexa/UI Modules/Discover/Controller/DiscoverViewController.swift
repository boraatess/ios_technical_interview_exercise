//
//  DiscoverViewController.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit
import SnapKit

class DiscoverViewController: BaseViewController<DiscoverViewModel> {
    
    var postsArray: [Post] = []
    
    private lazy var scrollView: CustomScrollView = {
        let scroll = CustomScrollView()
       // scroll.stackView.isHidden = true
        return scroll
    }()
    
    private let topView: TopNavigationView = {
        let view = TopNavigationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: ContentSizedTableView = {
        let tableView = ContentSizedTableView()
        tableView.layer.masksToBounds = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        tableView.isScrollEnabled = false
        tableView.register(DiscoverTableviewCell.self, forCellReuseIdentifier: "discoverCell")
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()
    
    var selectedUserid = ""
    var percentageOptionA = ""
    var percentageOptionB = ""
    var totalVotes = 0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVM()
        layout()
    }
    
}

extension DiscoverViewController {
    
    func configureVM() {
        viewModel.getPostDatas()
        
    }
    
    func layout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
        }
        
        topView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        scrollView.stackView.addArrangedSubview(topView)
        
        headerView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        scrollView.stackView.addArrangedSubview(headerView)
        
        scrollView.stackView.addArrangedSubview(tableView)

    }
    
}

extension DiscoverViewController: DiscoverViewModelOutputDelegate {
    
    func sendOptionsPercentage(percentA: String, percentB: String, totalVotes: Int) {
        self.percentageOptionA = percentA
        self.percentageOptionB = percentB
        self.totalVotes = totalVotes
    }
    
    func refreshTableview() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func sendPostDatas(with posts: [Post]) {
        
        print(posts)
        self.postsArray = posts
        
        
    }
    
}

extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "discoverCell", for: indexPath) as! DiscoverTableviewCell
        
        let post = postsArray[indexPath.row]
        
        cell.refreshCell(with: post)
        
        cell.selectionStyle = .none
        cell.output = self
        
        let id = self.postsArray[indexPath.row].user.id
        
        let canVote = self.viewModel.canVote(voterid: id)
        
        cell.refreshVoteView(with: canVote)
        
        if self.selectedUserid == id {
            cell.setPercentageText(optionA: self.percentageOptionA, optionB: self.percentageOptionB)
            cell.totalVotes = self.totalVotes
        }
        
        cell.totalVotes = self.totalVotes
        cell.updateTotalVotes(with: String(self.totalVotes))
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    
}

extension DiscoverViewController: discoverCellOutputDelegate {
    
    func leftButtonsendUserID(with id: String) {
        print("id is ->")
        print(id)
        self.selectedUserid = id
        self.viewModel.castVote(voterID: id, option: .optionA)
    }
    
    func rightButtonsendUserID(with id: String) {
        print("id is ->")
        print(id)
        self.selectedUserid = id
        self.viewModel.castVote(voterID: id, option: .optionB)
    }
    
}
