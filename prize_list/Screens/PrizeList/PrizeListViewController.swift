//
//  ViewController.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import UIKit

final class PrizeListViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var purchaseLimitLabel: UILabel!
    
    //MARK: - Property
    let viewModel = PrizeListViewModel()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        setTotalPrice()
        setPurchaseLimit()
    }
    
    //MARK: - Func
    private func registerTableViewCell() {
        tableView.register(UINib(nibName: PrizeCell.identifier, bundle: nil), forCellReuseIdentifier: PrizeCell.identifier)
    }
    
    private func setPurchaseLimit() {
        purchaseLimitLabel.text = viewModel.purchaseLimit.toDecimalPrice()
    }
    
    func setTotalPrice() {
        priceLabel.text = viewModel.getTotalPrice()
    }
    
    //MARK: - Actions
    @IBAction private func addButtonAction(_ sender: UIBarButtonItem) {
        let createNewViewController = CreateNewPrizeViewController.instance(.createNewPrize)
        createNewViewController.delegate = self
        navigationController?.pushViewController(createNewViewController, animated: true)
    }
    
    @IBAction private func setLimitPrice(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Please enter your purchase limit.", message: "By default is equal 100.0 $.", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Please enter your purchase limit."
            textField.applyPriceStyle()
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            guard let textField = alert.textFields?[0],
                  let priceString = textField.text,
                  let price = Double(priceString),
                  let self = self else { return }
            self.viewModel.purchaseLimit = price
            self.setPurchaseLimit()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: CreateNewPrizeProtocol
extension PrizeListViewController: CreateNewPrizeProtocol {
    func addNewPrize(_ model: Prize) {
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath.init(row: viewModel.dataArray.count - 1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
}
