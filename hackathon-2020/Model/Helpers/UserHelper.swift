//
//  UserHelper.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import Foundation

class UserHelper {
    
    static func isUserAuth() -> Bool {
        return getCurrUser() != nil
    }
    
    static func getCurrUser() -> RCurrUser? {
        let currUser = DataManager.shared.getCurrUsers().first
        return currUser
    }
    
    static func registrationUser(user: RUser) {
        DataManager.shared.writeUser(user: user)
    }
    
    static func authUser(withEmail email: String, password: String) -> Bool {
        guard let user = DataManager.shared.getUsers().filter("email = '\(email)'").first else { return false }
        guard user.password == password else { return false }
        
        
        let currUsers = DataManager.shared.getCurrUsers()
        for currUser in currUsers {
            DataManager.shared.deleteCurrUser(user: currUser)
        }

        let currUser = RCurrUser()
        currUser.email = user.email
        currUser.password = user.password
        currUser.birthDate = user.birthDate
        currUser.firstName = user.firstName
        currUser.lastName = user.lastName
        currUser.patronymic = user.patronymic
        currUser.gender = user.gender

        DataManager.shared.writeCurrUser(user: currUser)
        
        return true
    }
    
    static func yearCurrUser() -> Int? {
        guard let user = getCurrUser() else { return nil }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from:user.birthDate)!
        
        return Calendar.current.dateComponents([.year], from: date, to: Date()).year
    }
    
    static func addLikedEventToCurrUser(event: REvent) {
        guard let currUser = getCurrUser() else { return }
        
        // Если он уже добавлен, то выходим
        for le in currUser.likedEvents {
            if le.eventId == event.id {
                return
            }
        }
        
        DataManager.shared.addLikedEvent(toUser: currUser, event: event)
    }
    
    static func addLikedGroupToCurrUser(group: RGroups) {
        guard let currUser = getCurrUser() else { return }
        
        // Если он уже добавлен, то выходим
        for le in currUser.likedGroups {
            if le.groupId == group.id {
                return
            }
        }
        
        DataManager.shared.addLikedGroup(toUser: currUser, group: group)
    }
    
}
