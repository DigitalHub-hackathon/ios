//
//  REvent.swift
//  hackathon-2020
//
//  Created by art-off on 01.11.2020.
//

import Foundation
import RealmSwift

class REvent: Object, Decodable {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var status = ""
    @objc dynamic var price = ""
    @objc dynamic var type = ""
    @objc dynamic var direction = ""
    @objc dynamic var start_date = ""
    @objc dynamic var start_time = ""
    @objc dynamic var stop_date = ""
    @objc dynamic var stop_time = ""
    @objc dynamic var online = false
    @objc dynamic var place = ""
    @objc dynamic var area = ""
    @objc dynamic var health_limitations = false
    @objc dynamic var censorship = ""
    
    static override func primaryKey() -> String? {
        return "id"
    }
    
}
