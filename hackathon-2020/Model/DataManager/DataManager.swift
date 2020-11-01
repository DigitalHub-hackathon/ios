//
//  DataManager.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import Foundation
import RealmSwift

class DataManager {
    
    static let shared = DataManager()

    private let realm: Realm
    
    init() {
        let fileManager = FileManager.default
        
        // создаем дирректорию для приложения в Documents
        let hackURL = try! fileManager
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("hack")
        
        if !fileManager.fileExists(atPath: hackURL.path) {
            do {
                try fileManager.createDirectory(at: hackURL, withIntermediateDirectories: true, attributes: nil)
            } catch {
                NSLog("Не выходит создать папку в Document директории")
            }
        }
        
        let realmURL = hackURL.appendingPathComponent("hack.realm")
        
        var realmConfig = Realm.Configuration(fileURL: realmURL)
        
        // сомнительные МУВЫ
        realmConfig.deleteRealmIfMigrationNeeded = true
        
        print(realmURL)
        
        realm = try! Realm(configuration: realmConfig)
    }
    
}

// MARK: - User
extension DataManager {
    
    func getUsers() -> Results<RUser> {
        let users = realm.objects(RUser.self)
        return users
    }
    
    func writeUser(user: RUser) {
        try? realm.write {
            realm.add(user, update: .all)
        }
    }
    
    func deleteUser(user: RUser) {
        try? realm.write {
            realm.delete(user)
        }
    }
    
    func getCurrUsers() -> Results<RCurrUser> {
        let users = realm.objects(RCurrUser.self)
        return users
    }
    
    func writeCurrUser(user: RCurrUser) {
        try? realm.write {
            realm.add(user, update: .all)
        }
    }
    
    func deleteCurrUser(user: RCurrUser) {
        try? realm.write {
            realm.delete(user)
        }
    }
    
    func addLikedEvent(toUser user: RCurrUser, event: REvent) {
        try? realm.write {
            let likerEvent = RLikedEvents()
            likerEvent.eventId = event.id
            likerEvent.event = event
            user.likedEvents.append(likerEvent)
        }
    }
    
    func addLikedGroup(toUser user: RCurrUser, group: RGroups) {
        try? realm.write {
            let likerEvent = RLikedGroups()
            likerEvent.groupId = group.id
            likerEvent.group = group
            user.likedGroups.append(likerEvent)
        }
    }
    
}
