//
//  FroccsManager.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 03..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation
import UIKit

class FroccsManager {
    
    static let shared = FroccsManager()
    
    private var froccss = [Froccs]()
    
    private init() {
        update()
    }
    
    func getFrocsss() -> [Froccs] {
        var value = [Froccs]()
        value.append(contentsOf: froccss)
        return value
    }
    
    func getFroccs(from rate: Rate?) -> Froccs? {
        for froccs in froccss where froccs.rate?.wine == rate?.wine  && froccs.rate?.water == rate?.water {
            return Froccs(froccs: froccs)
        }
        
        return nil
    }
    
    func update() {
        DatabaseManager.shared.loadEntities { froccss, error in
            if let error = error {
                log.error(error.localizedDescription)
            } else if let froccss = froccss {
                log.debug(froccss.description)
                self.froccss = froccss
            }
        }
    }
    
}
