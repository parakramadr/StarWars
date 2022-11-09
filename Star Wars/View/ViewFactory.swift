//
//  ViewFactory.swift
//  Star Wars
//
//  Created by Parakrama Ranasinghe on 2022-11-08.
//


import UIKit

class ViewFactory {
    
    private init() { }
    
    static func createDetailView(for model: PlanetDataModel) -> PlanetDetailVC? {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        guard
            let view = storyboard
                       .instantiateViewController(withIdentifier: "PlanetDetailVC") as? PlanetDetailVC else { return nil }
        let viewModel = PlanetDetailVM(with: model)
        view.configure(with: viewModel)
        return view
    }
}
