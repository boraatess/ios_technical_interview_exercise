//
//  BaseVC.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import UIKit

class BaseViewController<ViewModel>: UIViewController where ViewModel: ViewModelProtocol {
    
    var viewModel: ViewModel
    
    init(with viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.outputDelegate = self as? ViewModel.T
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
