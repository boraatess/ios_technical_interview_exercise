//
//  DiscoverViewController.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit

class DiscoverViewController: UIViewController {

    var viewModel = DiscoverViewModel()
    
    
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
        viewModel.output = self
        
    }
    
    func layout() {
        view.backgroundColor = .white
        
    }
    
}

extension DiscoverViewController: DiscoverViewModelOutputDelegate {

    func sendPostDatas(with posts: [Post]) {
        
        print(posts)
    }
    
}
