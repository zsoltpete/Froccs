//
//  FroccsDetailInterfaces.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol FroccsDetailWireframeInterface: WireframeInterface {
}

protocol FroccsDetailViewInterface: BaseCollectionViewInterface {
    func setWineSlider(to wine: Int?)
    func setWaterSlider(to water: Int?)
    func setWineCoounter(to water: Int?)
    func setWaterCoounter(to water: Int?)
}

protocol FroccsDetailPresenterInterface: BaseCollectionPresenter {
    func wineSliderChanged(_ value: Int)
    func waterSliderChanged(_ value: Int)
    func headerItem(at section: Int) -> CellBindable
}

protocol FroccsDetailInteractorInterface: InteractorInterface {
}
