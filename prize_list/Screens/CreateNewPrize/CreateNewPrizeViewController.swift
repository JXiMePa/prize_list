//
//  CreateNewPrizeViewController.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import UIKit

protocol CreateNewPrizeProtocol: class {
    func addNewPrize(_ model: Prize)
}

final class CreateNewPrizeViewController: UIViewController {
    
    @IBOutlet private weak var nameField: InputField!
    @IBOutlet private weak var priceField: InputField!
    
    //MARK: - Property
    weak var delegate: CreateNewPrizeProtocol?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Funcs
    private func setupUI() {
        navigationItem.title = "CREATE NEW PRIZE"
        nameField.textField.placeholder("Please enter your name")
        nameField.textField.applyNameStyle()
        priceField.textField.placeholder("Please enter your price")
        priceField.textField.applyPriceStyle()
    }
    
    @IBAction func createButtonAction(_ sender: UIButton) {
        nameField.errorLabel.isHidden = nameField.textField.text?.isEmptySpace == false
        priceField.errorLabel.isHidden = priceField.textField.text?.isEmptySpace == false
        let newPrize = Prize()
        guard let costString = priceField.textField.text,
              let cost = Double(costString),
              let name = nameField.textField.text else {
            return
        }
        newPrize.name = name
        newPrize.cost = cost
        newPrize.id = UUID().uuidString
        newPrize.createdAt = Int(Date().timeIntervalSince1970)
        RealmHelper.saveObject(object: newPrize)
        delegate?.addNewPrize(newPrize)
        navigationController?.popViewController(animated: true)
    }
    
}
