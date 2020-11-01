//
//  ApiManager.swift
//  hackathon-2020
//
//  Created by art-off on 01.11.2020.
//

import Foundation

class ApiManager {
    
    static let shared = ApiManager()
    
    static func loadEvents(numberPage: Int, completion: @escaping ([REvent]?) -> Void) {
        let url = API.events(pageNumber: numberPage)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode) else {
                completion(nil)
                    return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let materialsResponse = try JSONDecoder().decode([REvent].self, from: data)
                completion(materialsResponse)
            } catch let jsonError {
                print(jsonError)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    static func loadGroups(numberPage: Int, completion: @escaping ([RGroups]?) -> Void) {
        let url = API.groups(pageNumber: numberPage)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode) else {
                completion(nil)
                    return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let materialsResponse = try JSONDecoder().decode([RGroups].self, from: data)
                completion(materialsResponse)
            } catch let jsonError {
                print(jsonError)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    static func loadRecomendationEvents(idEvents: [Int], completion: @escaping ([REvent]?) -> Void) {
        let url = API.recomendationEvents(idEvents: idEvents)
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode) else {
                completion(nil)
                    return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let materialsResponse = try JSONDecoder().decode([REvent].self, from: data)
                completion(materialsResponse)
            } catch let jsonError {
                print(jsonError)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    static func loadRecomendationGroups(idGroups: [Int], completion: @escaping ([RGroups]?) -> Void) {
        let url = API.recomendationGroups(idGroups: idGroups)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode) else {
                completion(nil)
                    return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let materialsResponse = try JSONDecoder().decode([RGroups].self, from: data)
                completion(materialsResponse)
            } catch let jsonError {
                print(jsonError)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    
}
