//
//  DetailHeaderCell.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 23..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

class DetailHeaderCell: UITableViewHeaderFooterView {
    
    // MARK: - Private properties -
    
    private var titleLabel: UILabel!
    private var separatorView: UIView!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        contentView.backgroundColor = .white
        initTitleLabel()
        initSeparatorView()
    }
    
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        
        titleLabel.font = .systemFont(ofSize: 10.0)
        titleLabel.textColor = .gray
        
        titleLabel.numberOfLines = 0
        //titleLabel.textAlignment = .center
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2.0)
            make.leading.equalToSuperview().offset(16.0)
            make.center.equalToSuperview()
        }
    }
    
    private func initSeparatorView() {
        separatorView = UIView()
        
        separatorView.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        
        contentView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1.0)
        }
    }
    
    func bind(_ text: CellBindable?) {
        guard let text = text as? String else {
            return
        }
        titleLabel.text = text
    }
    
}
