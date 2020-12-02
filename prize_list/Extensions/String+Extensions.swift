//
//  String+Extensions.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import Foundation

extension String {
    var isEmptySpace: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
