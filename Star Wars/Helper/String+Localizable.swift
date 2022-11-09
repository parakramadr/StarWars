//
//  String+Localizable.swift

//  Star Wars
//
//  Created by Parakrama Ranasinghe on 2022-11-08.
//


import Foundation

extension String {
    func localized() -> String{
        return NSLocalizedString(self, tableName:"Localizable", comment: "")
    }
}
