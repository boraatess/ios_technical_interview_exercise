//
//  BaseViewModel.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import Foundation

protocol ViewModelOutputProtocol: AnyObject {}

protocol ViewModelProtocol: AnyObject {
    associatedtype T
    var outputDelegate: T? { get set }
    func viewDidAppear()
}

extension ViewModelProtocol {
    func viewDidAppear() {}
}
