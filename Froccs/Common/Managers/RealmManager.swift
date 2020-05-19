//
//  RealmManager.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 19..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

protocol RealmManagerInterface {
    func writeContacts(_ contacts: [Contact])
    func readContacts() -> [Contact]
}

class RealmManager {
    
    static let shared = RealmManager()
    private let realm = try! Realm()
    
    private init() {
        log.debug("Realm database location: \(Realm.Configuration.defaultConfiguration.fileURL)")
    }
    
}

extension RealmManager: RealmManagerInterface {
    
    func writeContacts(_ contacts: [Contact]) {
        try! realm.write {
            realm.add(contacts)
        }
    }
    
    func readContacts() -> [Contact] {
        let result = realm.objects(Contact.self)
        let items = Array(result)
        return items
    }
}

