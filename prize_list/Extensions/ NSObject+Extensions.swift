//
//   NSObject+Extensions.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import Foundation

extension NSObject {
    class var identifier: String {
        return String(describing: self)
    }
}
