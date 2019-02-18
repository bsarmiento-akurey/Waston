//
//  Car.swift
//  Waston
//
//  Created by Bruno Sarmiento on 2/18/19.
//  Copyright © 2019 Akurey. All rights reserved.
//

import Foundation

class Car {
    var mark: String
    var model: String
    var year: Int
    
    init(mark: String, model: String, year: Int) {
        self.mark = mark
        self.model = model
        self.year = year
    }
}

extension Car: CustomStringConvertible {
    var description: String {
        return "\(mark) \(model) of \(year)"
    }
}
