//
//  DiscoverViewModel.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import Foundation

protocol DiscoverViewModelOutputDelegate: AnyObject {
    func sendPostDatas(with posts: [Post])
}

protocol DiscoverViewModelInputDelegate {
    func getPostDatas()
}

class DiscoverViewModel: DiscoverViewModelInputDelegate {
    
    weak var output: DiscoverViewModelOutputDelegate?
    
    let postManager = PostProvider.shared
    
    func getPostDatas() {
        
        postManager.fetchAll { result in
            switch result {
            case .success(let posts):
                // self.pollCardView.configure(with: posts)
                output?.sendPostDatas(with: posts)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                
            }
            
        }
        
        
    }
    
    
}
