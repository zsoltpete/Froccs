//
//  DetailCell.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 23..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    // MARK: - Private properties -
    
    private var titleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        selectionStyle = .none
        initTitleLabel()
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        
        titleLabel.textColor = .black
        
        titleLabel.numberOfLines = 0
        //titleLabel.textAlignment = .center
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8.0)
            make.leading.equalToSuperview().offset(20.0)
            make.center.equalToSuperview()
        }
    }
    
    func bind(_ text: CellBindable?) {
        guard let text = text as? String else {
            return
        }
        titleLabel.text = text
    }
    
}
