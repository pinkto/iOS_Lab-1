//
//  Trash.swift
//  iOS_Lab-1
//
//  Created by Anna Abdeeva on 22.02.2022.
//

import Foundation

struct Trash: ForestDwellers {
    var kkal: Int {
        GeneratorKkalForTrash.generateKkalForTrash()
    }
    var name: String = "Trash"
}


class GeneratorKkalForTrash {
    static func generateKkalForTrash() -> Int {
        return Int.random(in: -10 ... -1)
    }
}

extension Trash: CustomStringConvertible {
    var description: String {
        return "\(self.name)"
    }
}
