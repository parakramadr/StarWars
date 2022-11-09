//
//  CharactersVM.swift
//  Star Wars
//
//  Created by Parakrama Ranasinghe on 2022-11-08.
//


import Foundation
import RxSwift


class PlanetsVM {
    var planetModel: Planets?
    let network = NetworkService()
    
    
    var planets:  [PlanetResult]? {
        planetModel?.results
        
    }
    
    
}

//MARK: Routing Data Model
struct PlanetDataModel {
    let planet: PlanetResult?
    
}

extension PlanetsVM {
    
    func dataModel(for index: Int) -> PlanetDataModel {
        return PlanetDataModel(planet: planetModel?.results[index])
    }
}

//MARK: Network Requests
extension PlanetsVM {
    func fetchPlanets() -> Completable {
        return .create { observer in
            self.network.fetchPlanets()
                .subscribe(onSuccess: {
                    self.planetModel = $0
                    observer(.completed)
                }, onFailure: { error in
                    observer(.error(error))
                })
        }
    }
    
}
