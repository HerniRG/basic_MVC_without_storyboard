//
//  House.swift
//  Westeros
//
//  Created by Adrián Silva on 10/9/24.
//

import Foundation

enum House: String, CaseIterable {
    case stark = "House Stark"
    case targaryen = "House Targaryen"
    case lannister = "House Lannister"
}

extension House {
    var imageURL: URL? {
        switch self {
            case .stark:
                URL(string: "https://awoiaf.westeros.org/images/1/19/House_Stark.png")
            case .targaryen:
                URL(string: "https://awoiaf.westeros.org/images/thumb/1/1e/House_Targaryen.svg/545px-House_Targaryen.svg.png")
            case .lannister:
                URL(string: "https://awoiaf.westeros.org/images/8/88/House_Lannister.png")
        }
    }
}
