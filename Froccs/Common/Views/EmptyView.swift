//
//  EmptyView.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 23..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    // MARK: - Private properties -
    
    private var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        initImageView()
    }
    
    private func initImageView()  {
        imageView = UIImageView()
        
        let image = UIImage(named: "alcoholic")
        imageView.image = image
        
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
    }
    
}
