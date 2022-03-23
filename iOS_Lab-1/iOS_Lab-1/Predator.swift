//
//  Predator.swift
//  iOS_Lab-1
//
//  Created by Anna Abdeeva on 22.02.2022.
//

import Foundation

class Predator: ForestDwellers, Actions {
    
    var stomach: Array<ForestDwellers> = []
    var kkal: Int = 100
    var name: String = GeneratorForPredator.generateNamePredator()
    var weight: Float =  GeneratorForPredator.generateNumberOfWeight()

    func attack(_ eat: ForestDwellers) -> Bool {
        
        if let animal = eat as? Predator {
            if animal.protectItself() == false {
                if animal.weight <= weight {
                    kkal += animal.kkal/2
                    stomach.append(animal)
                    return true
                }
            }
        }
        
        if let animal = eat as? Herbivore {
            if animal.protectItself() == false {
                kkal += animal.kkal/2
                stomach.append(animal)
                return true
            }
            else {
                return false
            }
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
            return Int.random(in: 1...3)
        }
        
        if probabilityGeneration() == 1 {
            return true
        }
        else {
            return false
        }
    }
}

class GeneratorForPredator {
    static func generateNamePredator() -> String {
        let names = ["Tiger", "Wolf", "Fox", "Bear", "Sable"]
        return names.randomElement() ?? ""
    }
    static func generateNumberOfWeight() -> Float {
        return Float.random(in: 1.5...137.3)
    }
}

extension Predator: CustomStringConvertible {
    var description: String {
        return "\(self.name)\(stomach)"
    }
}
