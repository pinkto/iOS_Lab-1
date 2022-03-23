//
//  Plant.swift
//  iOS_Lab-1
//
//  Created by Anna Abdeeva on 22.02.2022.
//

import Foundation

struct Plant: ForestDwellers {
    var kkal: Int = 10
    var name: String {
        GeneratorForPlant.generateNameForPlant()
    }
}

class GeneratorForPlant {
    static func generateNameForPlant() -> String {
        let names = ["Grass", "Flower", "Honeysuckle", "Berry", "CowBerry"]
        return names.randomElement() ?? ""
    }
}

extension Plant: CustomStringConvertible {
    var description: String {
        return "\(self.name)"
    }
}
