//
//  DiscoverViewModel.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import Foundation

protocol DiscoverViewModelOutputDelegate: ViewModelOutputProtocol {
    func sendPostDatas(with posts: [Post])
    func refreshTableview()
    func sendOptionsPercentage(percentA: String, percentB: String, totalVotes: Int)
}

protocol DiscoverViewModelInputDelegate: ViewModelProtocol {
    func getPostDatas()
}

class DiscoverViewModel: DiscoverViewModelInputDelegate {
    
    typealias T = DiscoverViewModelOutputDelegate
    weak var outputDelegate: T?
    
    let postManager = PostProvider.shared
    
    enum Option {
        case optionA
        case optionB
    }

    var votesForOptionA = 0
    var votesForOptionB = 0
    
    func getPostDatas() {
        
        postManager.fetchAll { result in
            switch result {
            case .success(let posts):
                outputDelegate?.sendPostDatas(with: posts)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                
            }
        }
        
    }
    
    var voters: Set<String> = []

    func castVote(voterID: String, option: Option) {
        if voters.contains(voterID) {
            print("user already voted.")
            return
        }

        switch option {
        case .optionA:
            votesForOptionA += 1
        case .optionB:
            votesForOptionB += 1
        }
        voters.insert(voterID)
        print("vote saved")
        displayResults()
        outputDelegate?.refreshTableview()
        return
    }

    func canVote(voterid: String) -> Bool {
        if voters.contains(voterid) {
            return false
        }
        
        return true
    }
    
    func displayResults() {
        let totalVotes = votesForOptionA + votesForOptionB
        guard totalVotes > 0 else {
            print("not used vote yet")
            return
        }

        let percentageOptionA = (Double(votesForOptionA) / Double(totalVotes)) * 100
        let percentageOptionB = (Double(votesForOptionB) / Double(totalVotes)) * 100

        print("A option: \(percentageOptionA)%")
        print("B option: \(percentageOptionB)%")
        if let formattedPercA = Utils.shared.formatNumber(percentageOptionA),
           let formattedPercB = Utils.shared.formatNumber(percentageOptionB) {
            outputDelegate?.sendOptionsPercentage(percentA: formattedPercA, percentB: formattedPercB, totalVotes: totalVotes)
        }
        
     
        
    }
    
    
}
