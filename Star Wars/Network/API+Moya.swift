//
//  API.swift
//  Star Wars
//
//  Created by Parakrama Ranasinghe on 2022-11-08.
//


import Foundation
import Moya


enum API {
    case fetchPlanets
    
}

extension API: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://swapi.dev/api") else {
            fatalError("Base URL is invalid")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchPlanets:
            return "/planets"
            
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return nil
    }
}
