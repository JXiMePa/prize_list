//
//  UITextField+Extensions.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import UIKit

extension UITextField {
    func placeholder(_ text: String, color: UIColor = .gray) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
    func applyNameStyle() {
        autocorrectionType = .no
        autocapitalizationType = .none
    }
    
    func applyPriceStyle() {
        autocorrectionType = .no
        autocapitalizationType = .none
        keyboardType = .decimalPad
    }
}
