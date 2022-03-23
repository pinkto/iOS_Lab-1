//
//  Forest.swift
//  iOS_Lab-1
//
//  Created by Anna Abdeeva on 22.02.2022.
//

import Foundation

class Forest {
    var arrayOfForestDwellers: Array<ForestDwellers> = []
    var amountOfPreditor = 0
    var amountOfHerbivore = 0
    var amountOfTrash = 0
    
    init() {
        fillArrayWithDwellers()
        
    }
    
    
    func createDweller(from `class`: Any) -> ForestDwellers? {
        switch `class` {
        case is Predator.Type:
            return Predator()
        case is Herbivore.Type:
            return Herbivore()
        case is Plant.Type:
            return Plant()
        case is Trash.Type:
            return Trash()
        default:
            return nil
        }
    }
    
    func generateType() -> Any? {
        let array = [Predator.self, Herbivore.self, Plant.self, Trash.self] as [Any]
        return array.randomElement()
    }
    
    func fillArrayWithDwellers() {
        let predator = Predator()
        arrayOfForestDwellers.append(predator)
        for _ in 1..<10 {
            if let someType = generateType(),
               let dweller = createDweller(from: someType) {
                arrayOfForestDwellers.append(dweller)
                }
        }
        
        for i in 0..<10 {
            if arrayOfForestDwellers[i] is Predator {
                amountOfPreditor += 1
            }
            else if arrayOfForestDwellers[i] is Herbivore {
                amountOfHerbivore += 1
            }
            else if arrayOfForestDwellers[i] is Trash {
                amountOfTrash += 1
            }
        }
    }

    func indexGenerator() -> Int {
         return Int.random(in: 0..<arrayOfForestDwellers.count)
     }
    
    func dwellerTypeDefenition(forestDweller: ForestDwellers) {
        if forestDweller is Predator {
            amountOfPreditor -= 1
        }
        else if forestDweller is Herbivore {
            amountOfHerbivore -= 1
        }
        else if forestDweller is Trash {
            amountOfTrash -= 1
        }
    }
    
    func daySmulation() {
        while amountOfPreditor > 1 && amountOfHerbivore >= 0 && amountOfTrash >= 0 {
            let indexOfAttacker = indexGenerator()
            let indexOfVictim = indexGenerator()
            if indexOfAttacker != indexOfVictim {
                if let attacker = arrayOfForestDwellers[indexOfAttacker] as? Actions {
                    if attacker.attack(arrayOfForestDwellers[indexOfVictim]) {
                        dwellerTypeDefenition(forestDweller: arrayOfForestDwellers[indexOfVictim])
                        arrayOfForestDwellers.remove(at: indexOfVictim)
                    }
                }
            }
       
        }
        print (arrayOfForestDwellers)
    }
    
}



    

    
