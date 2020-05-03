//
//  FroccsItemCell.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

protocol FroccsItemCellBindable: CellBindable {
    var title: String? { get }
    var rate: Rate? { get }
}

class FroccsItemCell: UITableViewCell {
    
    // MARK: - Private properties -
    
    private var titleLabel: UILabel!
    private var rateView: RateView!
    
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
        contentView.backgroundColor = .white
        initTitleLabel()
        initRateView()
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20.0)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(16.0)
        }
    }
    
    private func initRateView() {
        rateView = RateView(frame: .zero)
        
        contentView.addSubview(rateView)
        rateView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20.0)
            make.centerY.equalToSuperview()
        }
    }
    
    func bind(_ model: CellBindable) {
        guard let model = model as? FroccsItemCellBindable  else  {
            return
        }
        titleLabel.text = model.title
        rateView.bind(rate: model.rate)
    }
}
