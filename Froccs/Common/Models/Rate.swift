//
//  Rate.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

class Rate: BaseResponse  {
    
    var wine: Double?
    var water: Double?
    
    init(wine: Double?, water: Double?) {
        self.wine = wine
        self.water = water
    }
    
}
