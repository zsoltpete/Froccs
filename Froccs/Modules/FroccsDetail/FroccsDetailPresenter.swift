//
//  FroccsDetailPresenter.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FroccsDetailPresenter {

    // MARK: - Private properties -

    private unowned let view: FroccsDetailViewInterface
    private let interactor: FroccsDetailInteractorInterface
    private let wireframe: FroccsDetailWireframeInterface
    
    private var froccs: Froccs?
    private var changingRate: Rate?


    // MARK: - Lifecycle -

    init(view: FroccsDetailViewInterface, interactor: FroccsDetailInteractorInterface, wireframe: FroccsDetailWireframeInterface, froccs: Froccs?) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.froccs = froccs
    }
    
    func viewDidLoad() {
        view.setTitle("Részletek")
        view.setWineSlider(to: froccs?.rate?.wine)
        view.setWaterSlider(to: froccs?.rate?.water)
        changingRate = Rate(wine: froccs?.rate?.wine, water: froccs?.rate?.water)
        updateView()
    }
    
    private func updateView() {
        view.setTitleLabel(froccs?.title)
        view.setDescription(froccs?.desc)
        view.setWineCoounter(to: froccs?.rate?.wine)
        view.setWaterCoounter(to: froccs?.rate?.water)
    }
    
    private func updateFroccs() {
        self.froccs = FroccsManager.shared.getFroccs(from: changingRate)
        updateView()
    }
}

// MARK: - Extensions -

extension FroccsDetailPresenter: FroccsDetailPresenterInterface {
    func wineSliderChanged(_ value: Int) {
        changingRate?.wine = value
        updateFroccs()
    }
    
    func waterSliderChanged(_ value: Int) {
        changingRate?.water = value
        updateFroccs()
    }
    
}
