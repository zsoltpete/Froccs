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
    var rate: Rate?
    
    init(name: String?, desc: String?, rate: Rate?) {
        self.name = name
        self.desc = desc
        self.rate = rate
    }
    
}

extension Froccs:  FroccsItemCellBindable {
    var title: String? {
        name
    }
}
