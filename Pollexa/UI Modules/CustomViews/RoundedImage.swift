//
//  RoundedImage.swift
//  Pollexa
//
//  Created by bora ateş on 12.06.2024.
//

import UIKit

class RoundedImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let size: CGFloat = 30
        self.frame = CGRect(x: (frame.width - size) / 2, y: (frame.height - size) / 2, width: size, height: size)
        
        layer.cornerRadius = size / 2
        layer.masksToBounds = true

        layer.borderColor = UIColor.white.cgColor
        // layer.borderWidth = 2.0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
