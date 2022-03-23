//
//  Herbivore.swift
//  iOS_Lab-1
//
//  Created by Anna Abdeeva on 22.02.2022.
//

import Foundation

class Herbivore: ForestDwellers, Actions {
    var stomach: Array<ForestDwellers> = []
    var kkal: Int = 50
    var name: String {
        GeneratorForHerbivore.generateNameForHerbivore()
    }
    func attack(_ eat: ForestDwellers) -> Bool {
        if let plant = eat as? Plant {
            kkal += plant.kkal
            stomach.append(plant)
            return true
        }
        
        if let trash = eat as? Trash {
            kkal += trash.kkal
            stomach.append(trash)
            return true
        }
        else {
            return false
        }
    }
    
    func protectItself() -> Bool {
        func probabilityGeneration() -> Int {
            return Int.random(in: 1...2)
        }
        
        if probabilityGeneration() == 1 {
            return true
        }
        else {
            return false
        }
    }
}

class GeneratorForHerbivore {
    static func generateNameForHerbivore() -> String {
        let names = ["Beaver", "Rabbit", "Squirrel", "Deer", "Porcupine"]
        return names.randomElement() ?? ""
    }
}

extension Herbivore: CustomStringConvertible {
    var description: String {
        return "\(self.name)\(stomach)"
    }
}
