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
    
    private var froccsss: [Froccs] {
        let item1 = Froccs(name: "KisFröccs", desc: " ritzte", rate: Rate(wine: 1, water: 1))
        let item2 = Froccs(name: "Nagyfröccs", desc: "", rate: Rate(wine: 2, water: 1))
        let item3 = Froccs(name: "Hosszúlépés", desc: "", rate: Rate(wine: 1, water: 2))
        let item4 = Froccs(name: "Házmester", desc: "", rate: Rate(wine: 3, water: 2))
        let item5 = Froccs(name: "Viceházmester", desc: "", rate: Rate(wine: 2, water: 3))
        let item6 = Froccs(name: "Háziúr (nagyházmester)", desc: "", rate: Rate(wine: 4, water: 1))
        let item7 = Froccs(name: "Sport fröccs", desc: "", rate: Rate(wine: 1, water: 4))
        let item8 = Froccs(name: "Lakó fröccs (kisházmester)", desc: "", rate: Rate(wine: 1, water: 4))
        let item9 = Froccs(name: "Krúdy fröccs", desc: "", rate: Rate(wine: 9, water: 1))
        let item10 = Froccs(name: "Sóher fröccs", desc: "", rate: Rate(wine: 1, water: 9))
        
        let item11 = Froccs(name: "Polgármester", desc: "", rate: Rate(wine: 6, water: 4))
        let item12 = Froccs(name: "Mafla vagy Maflás", desc: "", rate: Rate(wine: 5, water: 5))
        let item13 = Froccs(name: "Csatos", desc: "", rate: Rate(wine: 10, water: 5))
        let item14 = Froccs(name: "Lámpás", desc: "", rate: Rate(wine: 15, water: 5))
        let item15 = Froccs(name: "Magyar–angol", desc: "", rate: Rate(wine: 6, water: 3))
        let item16 = Froccs(name: "Bakteranyós", desc: "", rate: Rate(wine: 2, water: 2))
        
        return [
            item1,
            item2,
            item3,
            item4,
            item5,
            item6,
            item7,
            item8,
            item9,
            item10,
            item11,
            item12,
            item13,
            item14,
            item15,
            item16
        ]
    }
    
    private init() {
        
    }
    
    func getFrocsss() -> [Froccs] {
        var value = [Froccs]()
        value.append(contentsOf: froccsss)
        return value
    }
    
    func getFroccs(from rate: Rate?) -> Froccs? {
        for froccs in froccsss where froccs.rate?.wine == rate?.wine  && froccs.rate?.water == rate?.water {
            return Froccs(froccs: froccs)
        }
        
        return nil
    }
    
}
