//
//  FroccsListInterfaces.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright (c) 2020. levivig. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol FroccsListWireframeInterface: WireframeInterface {
    func openDetail(_ froccs: Froccs?)
}

protocol FroccsListViewInterface: BaseCollectionViewInterface {
}

protocol FroccsListPresenterInterface: BaseCollectionPresenter {
}

protocol FroccsListInteractorInterface: InteractorInterface {
    func getFroccss(completition: (FroccsListResponse) -> Void)
}
