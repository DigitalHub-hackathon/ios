//
//  RUser.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import RealmSwift

class RUser: Object {
    
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var patronymic = ""
    @objc dynamic var gender = RGender.male.rawValue
    @objc dynamic var birthDate = ""
    @objc dynamic var email = ""
    @objc dynamic var password = ""
    
    static override func primaryKey() -> String? {
        return "email"
    }
    
}


enum RGender: String {
    case male
    case female
}
