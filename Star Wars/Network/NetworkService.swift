//
//  NetworkService.swift
//  Star Wars
//
//  Created by Parakrama Ranasinghe on 2022-11-08.
//


import Foundation
import RxSwift
import Moya

protocol NetworkServiceProtocol {
    func fetchPlanets() -> Single<Planets>
 
}

class NetworkService: NetworkServiceProtocol {
    
    private let provider = MoyaProvider<API>()

    func fetchPlanets() -> Single<Planets> {
        return provider.rx.request(.fetchPlanets)
            .filterSuccessfulStatusAndRedirectCodes()
            .map(Planets.self)
    }
    
   
}
