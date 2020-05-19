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
        
        wineLabel.textColor = .darkYellow
        wineLabel.font = .systemFont(ofSize: 14.0)
        
        addSubview(wineLabel)
        wineLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(0.0)
            make.centerY.equalToSuperview()
        }
    }
    
    private func initWineImageView() {
        wineImageView = UIImageView()
        
        let image = UIImage(named: "wine")?.withRenderingMode(.alwaysTemplate)
        wineImageView.image = image
        
        wineImageView.tintColor = .yellow
        
        addSubview(wineImageView)
        wineImageView.snp.makeConstraints { make in
            make.leading.equalTo(wineLabel.snp.trailing).offset(-1.0)
            make.centerY.equalToSuperview()
        }
    }
    
    private func initWaterLabel() {
        waterLabel = UILabel()
        
        waterLabel.textColor = .darkBlue
        waterLabel.font = .systemFont(ofSize: 14.0)
        
        addSubview(waterLabel)
        waterLabel.snp.makeConstraints { make in
            make.leading.equalTo(wineImageView.snp.trailing).offset(4.0)
            make.centerY.equalToSuperview()
        }
    }
    
    private func initWaterImageView() {
        waterImageView = UIImageView()
        
        let image = UIImage(named: "water")?.withRenderingMode(.alwaysTemplate)
        waterImageView.image = image
        
        waterImageView.tintColor = .blue
        
        addSubview(waterImageView)
        waterImageView.snp.makeConstraints { make in
            make.leading.equalTo(waterLabel.snp.trailing).offset(-1.0)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func bind(rate: Rate?) {
        guard let rate = rate else  {
            return
        }
        wineLabel.text = rate.wineFormatted
        waterLabel.text = rate.waterFormatted
    }
    
}
