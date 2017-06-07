//
//  structsEnums.swift
//  Calculator
//
//  Created by Jason Behnke on 5/31/17.
//  Copyright © 2017 Jason Behnke. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"
    case minus = "-"
    case divide = "/"
    case times = "*"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "new NumStarted"
}
