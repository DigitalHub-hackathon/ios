//
//  RCurrUser.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import RealmSwift

class RCurrUser: Object {
    
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var patronymic = ""
    @objc dynamic var gender = RGender.male.rawValue
    @objc dynamic var birthDate = ""
    @objc dynamic var email = ""
    @objc dynamic var password = ""
    
    var likedEvents = List<RLikedEvents>()
    var likedGroups = List<RLikedGroups>()
    
    static override func primaryKey() -> String? {
        return "email"
    }
    
}

class RLikedEvents: Object {
    
    @objc dynamic var eventId = 0
    @objc dynamic var event: REvent?
    
}

class RLikedGroups: Object {
    
    @objc dynamic var groupId = 0
    @objc dynamic var group: RGroups?
    
}
