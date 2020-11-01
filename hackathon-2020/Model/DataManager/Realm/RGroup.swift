//
//  RGroup.swift
//  hackathon-2020
//
//  Created by art-off on 01.11.2020.
//

import Foundation
import RealmSwift

class RGroups: Object, Decodable {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var finance = 0
    @objc dynamic var schedule = 0
    @objc dynamic var duration = ""
    @objc dynamic var organization: ROrganization?
    
    static override func primaryKey() -> String? {
        return "id"
    }
    
}

class ROrganization: Object, Decodable {
    
    @objc dynamic var name = ""
    @objc dynamic var street = ""
    @objc dynamic var metro = ""
    
}
