//
//  UIViewController+Extensions.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import UIKit

extension UIViewController {
    
    func showAlert(_ title: String = "Sorry, something went wrong", message: String? = nil, buttonTitle: String = "OK", completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
