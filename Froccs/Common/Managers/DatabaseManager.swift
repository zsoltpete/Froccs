//
//  DatabaseManager.swift
//  Froccs
//
//  Created by Zsolt Pete on 2020. 05. 23..
//  Copyright © 2020. levivig. All rights reserved.
//

import Foundation
import SQLite
import UIKit

typealias BoolCompletition = (Bool) -> Void
typealias FroccsErrorCompletion = ([Froccs]?, Error?) -> Void

protocol DatabaseManaging {
    func removeAll()
    func loadEntities(completion: FroccsErrorCompletion)
    func initEntity(row: Row) -> Froccs
}

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    internal var db: Connection?
    
    private let databaseName = "list"
    
    fileprivate let list = Table("list")
    fileprivate let name = Expression<String?>("name")
    fileprivate let desc = Expression<String?>("desc")
    fileprivate let wineRate = Expression<Int?>("wineRate")
    fileprivate let waterRate = Expression<Int?>("waterRate")
    
    private init() {
        self.openIfNeeded()
    }
    
    internal func openIfNeeded() {
        if self.db != nil {
            return
        }
        self.copyDatabaseIfNeeded(self.databaseName)
        if let path = NSSearchPathForDirectoriesInDomains(
            .libraryDirectory, .userDomainMask, true
        ).first {
            log.info(path)
            do {
                let db = try Connection("\(path)/\(databaseName).db")
                log.info("Database opened...")
                self.db = db
            } catch {
                log.error(error.localizedDescription)
            }
        }
    }
    
    private func copyDatabaseIfNeeded(_ database: String) {
        
        let fileManager = FileManager.default
        
        let documentsUrl = fileManager.urls(for: .libraryDirectory, in: .userDomainMask)
        
        guard !documentsUrl.isEmpty else {
            return
        }
        
        let finalDatabaseURL = documentsUrl.first!.appendingPathComponent("\(database).db")
        
        if !( (try? finalDatabaseURL.checkResourceIsReachable()) ?? false) {
            log.info("DB does not exist in documents folder")
            
            let databaseInMainBundleURL = Bundle.main.resourceURL?.appendingPathComponent("\(database).db")
            
            do {
                try fileManager.copyItem(atPath: (databaseInMainBundleURL?.path)!, toPath: finalDatabaseURL.path)
            } catch let error as NSError {
                log.error("Couldn't copy file to final location! Error:\(error.description)")
            }
            
        } else {
            log.error("Database file found at path: \(finalDatabaseURL.path)")
        }
    }
    
    func removeTables() {
    }
    
}

extension DatabaseManager: DatabaseManaging {
    
    func initEntity(row: Row) -> Froccs {
        let name = row[self.name]
        let desc = row[self.desc]
        let wineRate = row[self.wineRate]
        let waterRate = row[self.waterRate]
        let rate = Rate(wine: wineRate, water: waterRate)
        let entity = Froccs(name: name, desc: desc, rate: rate)
        return entity
    }
    
    func removeAll() {
        self.openIfNeeded()
        do {
            let rowid = try db?.run(list.delete())
            if rowid != nil {
                log.info("Froccs table deleted...")
            }
        } catch {
            log.error(error.localizedDescription)
        }
    }
    
    func loadEntities(completion: FroccsErrorCompletion) {
        self.openIfNeeded()
        let query = list
        var entityList = [Froccs]()
        do {
            guard let selectRow = try db?.prepare(query) else {
                completion(nil, nil)
                return
            }
            selectRow.forEach({ [weak self]row in
                if let entity = self?.initEntity(row: row) {
                    entityList.append(entity)
                }
            })
        } catch {
            completion(nil, error)
            return
        }
        completion(entityList, nil)
    }
    
}
