//
//  SplashViewModel.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import Foundation


protocol SplashViewModelInputDelegate: ViewModelProtocol {
    func checkReachability()
}

protocol SplashViewModelOutputDelegate: ViewModelOutputProtocol {
    func showError(with error: String)
    func goMainScene()
}


class SplashViewModel: SplashViewModelInputDelegate {
    
    typealias T = SplashViewModelOutputDelegate
    weak var outputDelegate: T?
        
    // check network connection...
    func checkReachability() {
        outputDelegate?.goMainScene()
        
    }
    
    
}
