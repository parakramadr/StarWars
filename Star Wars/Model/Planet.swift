//
//  People.swift
//  Star Wars
//
//  Created by Parakrama Ranasinghe on 2022-11-08.
//


import Foundation

// MARK: - Welcome
struct Planets: Codable {
    let results: [PlanetResult]
}

// MARK: - Result
struct PlanetResult: Codable {
    let name, climate,orbital_Period,gravity: String
  

    enum CodingKeys: String, CodingKey {
        case name, climate,gravity
        case orbital_Period = "orbital_period"
    }
}


