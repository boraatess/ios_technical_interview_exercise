//
//  DiscoverViewModel.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import Foundation

protocol DiscoverViewModelOutputDelegate: ViewModelOutputProtocol {
    func sendPostDatas(with posts: [Post])
}

protocol DiscoverViewModelInputDelegate: ViewModelProtocol {
    func getPostDatas()
}

class DiscoverViewModel: DiscoverViewModelInputDelegate {
    
    typealias T = DiscoverViewModelOutputDelegate
    weak var outputDelegate: T?
    
    let postManager = PostProvider.shared
    
    func getPostDatas() {
        
        postManager.fetchAll { result in
            switch result {
            case .success(let posts):
                // self.pollCardView.configure(with: posts)
                outputDelegate?.sendPostDatas(with: posts)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                
            }
            
        }
        
        
    }
    
    
}
