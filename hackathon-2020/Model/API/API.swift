//
//  API.swift
//  hackathon-2020
//
//  Created by art-off on 01.11.2020.
//

import Foundation

struct API {
    
    static let address = "http://193.187.173.215/api"
    
    static func events(pageNumber: Int) -> URL {
        return URL(string: "\(address)/events/\(pageNumber)")!
    }
    
    static func groups(pageNumber: Int) -> URL {
        return URL(string: "\(address)/groups/\(pageNumber)")!
    }
    
    static func recomendationEvents(idEvents: [Int]) -> URL {
        var components = URLComponents(string: "\(address)/predict_event")!
        var stringIds = ""
        for idEvent in idEvents {
            stringIds += "\(idEvent) "
        }
        if !stringIds.isEmpty {
            stringIds.remove(at: stringIds.index(before: stringIds.endIndex))
        }
        components.queryItems = [URLQueryItem(name: "likes", value: stringIds)]
        
        return components.url!
    }
    
    static func recomendationGroups(idGroups: [Int]) -> URL {
        var components = URLComponents(string: "\(address)/predict_groups")!
        var stringIds = ""
        for idGroup in idGroups {
            stringIds += "\(idGroup) "
        }
        if !stringIds.isEmpty {
            stringIds.remove(at: stringIds.index(before: stringIds.endIndex))
        }
        components.queryItems = [URLQueryItem(name: "likes", value: stringIds)]
        
        return components.url!
    }
    
}
