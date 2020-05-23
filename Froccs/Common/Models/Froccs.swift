//
//  Froccs.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation

class Froccs: BaseResponse  {
    
    var name: String?
    var desc: String?
    var percentage: Double?
    var history: String?
    var rate: Rate?
    
    init(name: String?, desc: String?, rate: Rate?, percentage: Double?, history: String?) {
        self.name = name
        self.desc = desc
        self.rate = rate
        self.history = history
        self.percentage = percentage
    }
    
    init(froccs: Froccs) {
        self.name = froccs.name
        self.desc = froccs.desc
        self.rate = froccs.rate
        self.percentage = froccs.percentage
        self.history = froccs.history
    }
    
}

extension Froccs:  FroccsItemCellBindable {
    var title: String? {
        name
    }
}
