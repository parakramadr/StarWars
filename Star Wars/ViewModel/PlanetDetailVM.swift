//
//  CharacterDetailVM.swift
//  StarWars
//
//  Created by Ratul Chhibber on 16/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import Foundation

class PlanetDetailVM {
    
    enum SectionType {
        case attributes
    }
    
    enum RowType {
        case name, orbital_Period, gravity
    }
    
    var model: PlanetDataModel?
    
    init(with model: PlanetDataModel) {
        self.model = model
    }
    
    
    
    var sectionCount: Int {
        return 1
    }
    
    func rowCount() -> Int {
        
        return attributeRows.count
        
        
    }
    
    private var attributeRows: [RowType] {
        let rows: [RowType] = [
            .name, .orbital_Period, .gravity
        ]
        return rows
    }
    
 
    private func rowType(for index: IndexPath) -> RowType {
        
        return attributeRows[index.row]
        
        
    }
    
    func rowDetails(for index: IndexPath) -> (description: String, value: String?) {
        
        
        let row = rowType(for: index)
        
        switch (row) {
        case (.name):
            return ("Name", model?.planet?.name)
        case (.orbital_Period):
            return ("Orbital Period", model?.planet?.orbital_Period)
        case (.gravity):
            return ("Gravity", model?.planet?.gravity)
            
            
        }
    }
    
    
}
