//
//  BaseCollectionPresenter.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

protocol CellBindable {
    
}

protocol BaseCollectionPresenter: PresenterInterface {
    func numberOfSections() -> Int
    func numberOfItem(in section: Int) -> Int
    func itemForRow(at indexPath: IndexPath) -> CellBindable
    func selectItem(at indexPath: IndexPath)
}

extension BaseCollectionPresenter {
    func numberOfSections() -> Int {
        1
    }
}
