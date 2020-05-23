//
//  FroccsDetailViewController.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import TBEmptyDataSet
import UIKit

final class FroccsDetailViewController: BaseTabbarProtocolController {
    
    override var tabbarImage: UIImage? {
        UIImage(named: "water_colored")?.withRenderingMode(.alwaysTemplate)
    }
    
    override var selectedTabbarImage: UIImage? {
        UIImage(named: "water_colored")?.withRenderingMode(.alwaysOriginal)
    }

    // MARK: - Public properties -

    var presenter: FroccsDetailPresenterInterface!
    
    // MARK: - Private properties -
    
    private var wineSlider: UISlider!
    private var waterSlider: UISlider!
    private var wineCounterLabel: UILabel!
    private var waterCounterLabel: UILabel!
    
    private var tableView: UITableView!
    
    private var separatorView: UIView!
    private var scoreView: ScoreView!
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated)
//        scoreView.start(0.0)
    }
    
    private func setup() {
        initWaterSlider()
        initWineSlider()
        initWineCounterLabel()
        initWaterCounterLabel()
        initSeparatorView()
        initTableView()
//        initScoreView()
    }
    
    private func initWaterSlider() {
        waterSlider = UISlider()
        
        waterSlider.minimumValue = 0
        waterSlider.maximumValue = 10
        waterSlider.tag = 1
        
        waterSlider.tintColor = .darkBlue
        waterSlider.minimumTrackTintColor = .darkBlue
        waterSlider.thumbTintColor = .darkBlue
        
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
        
        wineSlider.tintColor = .darkYellow
        wineSlider.minimumTrackTintColor = .darkYellow
        wineSlider.thumbTintColor = .darkYellow
        
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
    
    private func initTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(cellWithClass: DetailCell.self)
        tableView.register(headerFooterViewClassWith: DetailHeaderCell.self)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.emptyDataSetDataSource = self
        
        tableView.separatorStyle = .none
        
        tableView.contentInset = UIEdgeInsets(top: 16.0, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.backgroundColor = .clear
        
//        let footer = ScoreView()
//        footer.size = CGSize(width: view.width, height: 300.0)
//
//        tableView.tableFooterView = footer
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(0.0)
            make.bottom.equalTo(separatorView.snp.top)
        }
    }
    
    private func initScoreView() {
        scoreView = ScoreView()
        scoreView.backgroundColor = .purple
        
        view.addSubview(scoreView)
        scoreView.snp.makeConstraints { make in
            make.bottom.equalTo(separatorView)
            make.centerX.leading.equalToSuperview()
            make.height.equalTo(300.0)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}

// MARK: - Extensions -

extension FroccsDetailViewController: FroccsDetailViewInterface {
    func reloadList() {
        tableView.reloadData()
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

extension FroccsDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItem(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: DetailCell.self)
        let model = presenter.itemForRow(at: indexPath)
        cell.bind(model)
        return cell
    }
    
    
}

extension FroccsDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withClass: DetailHeaderCell.self)
        let model = presenter.headerItem(at: section)
        cell.bind(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = ScoreView()
        
        footer.frame = CGRect(x: 0, y: 0, width: tableView.width, height: 300.0)
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == presenter.numberOfSections() - 1 {
            return 300.0
        }
        return 0.0
    }
    
}

extension FroccsDetailViewController: TBEmptyDataSetDataSource {
    func customViewForEmptyDataSet(in scrollView: UIScrollView) -> UIView? {
        let view = EmptyView(frame: scrollView.frame)
        
        return view
    }
}
