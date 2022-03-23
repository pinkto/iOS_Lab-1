//
//  Actions.swift
//  iOS_Lab-1
//
//  Created by Anna Abdeeva on 22.02.2022.
//

import Foundation

protocol Actions: CustomStringConvertible {
    var stomach: Array<ForestDwellers> {get set}
    func attack(_ eat: ForestDwellers) -> Bool
    func protectItself() -> Bool
    func showStomach()
}

extension Actions {
    func showStomach() {
        print(self.description)
    }
}
