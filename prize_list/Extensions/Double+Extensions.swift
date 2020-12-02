//
//  Double+Extensions.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import Foundation

extension Double {
    func toDecimalPrice(_ currency: String = "$") -> String {
       return currency + " " + String(format: "%.2f", self)
    }
}
