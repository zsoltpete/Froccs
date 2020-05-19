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
        let item1 = Froccs(name: "KisFröccs", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 1, water: 1))
        let item2 = Froccs(name: "Nagyfröccs", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 2, water: 1))
        let item3 = Froccs(name: "Hosszúlépés", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 1, water: 2))
        let item4 = Froccs(name: "Házmester", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 3, water: 2))
        let item5 = Froccs(name: "Viceházmester", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 2, water: 3))
        let item6 = Froccs(name: "Háziúr (nagyházmester)", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 4, water: 1))
        let item7 = Froccs(name: "Sport fröccs", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 1, water: 4))
        let item8 = Froccs(name: "Lakó fröccs (kisházmester)", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 1, water: 4))
        let item9 = Froccs(name: "Krúdy fröccs", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 9, water: 1))
        let item10 = Froccs(name: "Sóher fröccs", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 1, water: 9))
        
        let item11 = Froccs(name: "Polgármester", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 6, water: 4))
        let item12 = Froccs(name: "Mafla vagy Maflás", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 5, water: 5))
        let item13 = Froccs(name: "Csatos", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 10, water: 5))
        let item14 = Froccs(name: "Lámpás", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 15, water: 5))
        let item15 = Froccs(name: "Magyar–angol", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 6, water: 3))
        let item16 = Froccs(name: "Bakteranyós", desc: "A fröccs bor és szódavíz keveréséből alkotott ital. 2013-ban felvették a Magyar Értéktárba. A bor és szódavíz mennyisége alapján különféle nevű fröccsök léteznek. A fröccs elnevezést alkalmazzák más szeszes, sőt nem szeszes italkeverékekre is, sőt bizonyos italok egymás utáni fogyasztására, azaz nem a pohárban, hanem a szájban vagy gyomorban való keverésére is. Német nyelvterületen is ismert Gemischt, Weinschorle vagy Sauergespritzter néven. (Forrás: Wikipédia)", rate: Rate(wine: 2, water: 2))
        
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
