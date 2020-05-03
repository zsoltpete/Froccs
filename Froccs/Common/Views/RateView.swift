//
//  RateView.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

class RateView: UIView {
    
    // MARK: - Private properties -
    
    private var wineLabel: UILabel!
    private var wineImageView: UIImageView!
    private var waterLabel: UILabel!
    private var waterImageView: UIImageView!
    
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
        initWineLabel()
        initWineImageView()
        initWaterLabel()
        initWaterImageView()
    }
    
    private func initWineLabel() {
        wineLabel = UILabel()
        
        addSubview(wineLabel)
        wineLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(0.0)
            make.centerY.equalToSuperview()
        }
    }
    
    private func initWineImageView() {
        wineImageView = UIImageView()
        
        let image = UIImage(named: "wine")
        wineImageView.image = image
        
        addSubview(wineImageView)
        wineImageView.snp.makeConstraints { make in
            make.leading.equalTo(wineLabel.snp.trailing).offset(2.0)
            make.centerY.equalToSuperview()
        }
    }
    
    private func initWaterLabel() {
        waterLabel = UILabel()
        
        addSubview(waterLabel)
        waterLabel.snp.makeConstraints { make in
            make.leading.equalTo(wineImageView.snp.trailing)
            make.centerY.equalToSuperview()
        }
    }
    
    private func initWaterImageView() {
        waterImageView = UIImageView()
        
        let image = UIImage(named: "water")
        waterImageView.image = image
        
        addSubview(waterImageView)
        waterImageView.snp.makeConstraints { make in
            make.leading.equalTo(waterLabel.snp.trailing).offset(2.0)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func bind(rate: Rate?) {
        guard let rate = rate else  {
            return
        }
        wineLabel.text = String(format: "%gx", rate.wine ?? 0)
        waterLabel.text = String(format: "%gx", rate.water ?? 0)
    }
    
}
