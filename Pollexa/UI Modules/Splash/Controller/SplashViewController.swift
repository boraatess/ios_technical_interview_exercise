//
//  SplashViewController.swift
//  Pollexa
//
//  Created by bora ateş on 6.06.2024.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let logoImageview: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "splashLogo")
        return iv
    }()
    
    var viewModel = SplashViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("splash")
        viewModel.outputdelegate = self
        configureVM()
        layout()
    }
    
    func showDiscoverScene() {
        let vc = DiscoverViewController(with: .init())
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
}

extension SplashViewController {
    
    func configureVM() {
        viewModel.checkReachability()
        viewModel.outputdelegate = self
    }
    
    func layout() {
        view.backgroundColor = .white
        view.addSubview(logoImageview)
        logoImageview.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(200)
            
        }
    }
    
}

extension SplashViewController: SplashViewModelOutputDelegate {
    
    func showError(with error: String) {
        
        
    }
    
    func goMainScene() {
        
        print("go main")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+4) {
            let vc = DiscoverViewController(with: .init())
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
        
    }
}
