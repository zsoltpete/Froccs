//
//  Rate.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

class Rate: BaseResponse  {
    
    var wine: Int?
    var water: Int?
    
    var wineFormatted:String {
        String(format: "%dx", wine ?? 0)
    }
    
    var waterFormatted:String {
        String(format: "%dx", water ?? 0)
    }
    
    init(wine: Int?, water: Int?) {
        self.wine = wine
        self.water = water
    }
    
}
