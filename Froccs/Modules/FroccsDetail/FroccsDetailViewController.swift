//
//  FroccsDetailViewController.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FroccsDetailViewController: BaseTabbarProtocolController {
    
    override var tabbarImage: UIImage? {
        UIImage(named: "water")?.withRenderingMode(.alwaysOriginal)
    }
    
    override var selectedTabbarImage: UIImage? {
        UIImage(named: "water")?.withRenderingMode(.alwaysTemplate)
    }

    // MARK: - Public properties -

    var presenter: FroccsDetailPresenterInterface!
    
    // MARK: - Private properties -
    
    private var wineSlider: UISlider!
    private var waterSlider: UISlider!
    private var wineCounterLabel: UILabel!
    private var waterCounterLabel: UILabel!
    
    private var scrollView: UIScrollView!
    private var titleLabel: UILabel!
    private var descLabel: UILabel!
    
    private var separatorView: UIView!
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated)
    }
    
    private func setup() {
        initWaterSlider()
        initWineSlider()
        initWineCounterLabel()
        initWaterCounterLabel()
        initScrollView()
        initTitleLabel()
        initDescLabel()
        initSeparatorView()
    }
    
    private func initWaterSlider() {
        waterSlider = UISlider()
        
        waterSlider.minimumValue = 0
        waterSlider.maximumValue = 10
        waterSlider.tag = 1
        
        waterSlider.addTarget(self, action: #selector(waterSliderChanged(_:)), for: .valueChanged)
        
        view.addSubview(waterSlider)
        waterSlider.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16.0)
            make.width.equalToSuperview().multipliedBy(0.65)
        }
    }
    
    @objc
    private func waterSliderChanged(_ sender: Any) {
        guard let slider = sender as? UISlider else {
            return
        }
        let value = slider.value
        presenter.waterSliderChanged(Int(value))
    }
    
    private func initWineSlider() {
        wineSlider = UISlider()
        
        wineSlider.minimumValue = 0
        wineSlider.maximumValue = 10
        wineSlider.tag = 0
        
        wineSlider.addTarget(self, action: #selector(wineSliderChanged(_:)), for: .valueChanged)
        
        view.addSubview(wineSlider)
        wineSlider.snp.makeConstraints { make in
            make.trailing.equalTo(waterSlider)
            make.bottom.equalTo(waterSlider.snp.top).offset(-10.0)
            make.width.equalTo(waterSlider)
        }
    }
    
    @objc
    private func wineSliderChanged(_ sender: Any) {
        guard let slider = sender as? UISlider else {
            return
        }
        let value = slider.value
        presenter.wineSliderChanged(Int(value))
    }
    
    private func initWineCounterLabel() {
        wineCounterLabel = UILabel()
        
        view.addSubview(wineCounterLabel)
        wineCounterLabel.snp.makeConstraints { make in
            make.centerY.equalTo(wineSlider)
            make.leading.equalToSuperview().offset(20.0)
        }
    }
    
    private func initWaterCounterLabel() {
        waterCounterLabel = UILabel()
        
        view.addSubview(waterCounterLabel)
        waterCounterLabel.snp.makeConstraints { make in
            make.centerY.equalTo(waterSlider)
            make.leading.equalToSuperview().offset(20.0)
        }
    }
    
    private func initScrollView() {
        scrollView = UIScrollView()
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.bottom.equalTo(wineSlider.snp.top)
            make.leading.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        scrollView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20.0)
            make.top.equalToSuperview().offset(20.0)
        }
    }
    
    private func initDescLabel() {
        descLabel = UILabel()
        
        descLabel.numberOfLines = 0
        
        scrollView.addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20.0)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20.0)
            make.bottom.equalToSuperview()
        }
    }
    
    private func initSeparatorView() {
        separatorView = UIView()
        
        separatorView.backgroundColor = .gray
        
        view.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.leading.centerX.equalToSuperview()
            make.height.equalTo(1.0)
            make.bottom.equalTo(wineSlider.snp.top).offset(-16.0)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = descLabel.y + descLabel.height
        scrollView.contentSize = CGSize(width: scrollView.width, height: height)
    }
    
}

// MARK: - Extensions -

extension FroccsDetailViewController: FroccsDetailViewInterface {
    func setTitleLabel(_ title: String?) {
        titleLabel.text = title
    }
    
    func setDescription(_ desc: String?) {
        descLabel.text = desc
    }
    
    func setWineSlider(to wine: Int?) {
        let value = Float(wine ?? 0)
        wineSlider.setValue(value, animated: false)
    }
    
    func setWaterSlider(to water: Int?) {
        let value = Float(water ?? 0)
        waterSlider.setValue(value, animated: false)
    }
    
    func setWineCoounter(to wine: Int?) {
        wineCounterLabel.text = String(format: "Bor: %d", wine ?? 0)
    }
    
    func setWaterCoounter(to water: Int?) {
        waterCounterLabel.text = String(format: "Szóda: %d", water ?? 0)
    }
    
}
