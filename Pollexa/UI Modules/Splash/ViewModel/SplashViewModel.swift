//
//  SplashViewModel.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import Foundation


protocol SplashViewModelInputDelegate: AnyObject {
    func checkReachability()
}

protocol SplashViewModelOutputDelegate: AnyObject {
    func showError(with error: String)
    func goMainScene()
}


class SplashViewModel: SplashViewModelInputDelegate {
    
    weak var outputdelegate: SplashViewModelOutputDelegate?
    
    // check network connection...
    
    func checkReachability() {
        
        print("checked")
        outputdelegate?.goMainScene()
        
    }
    
    
    
    
    
    
}
