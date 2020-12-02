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
    
    //MARK: - Property
    let viewModel = PrizeListViewModel()

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        setTotalPrice()
    }
    
    //MARK: - Func
    private func registerTableViewCell() {
        tableView.register(UINib(nibName: PrizeCell.identifier, bundle: nil), forCellReuseIdentifier: PrizeCell.identifier)
    }

    func setTotalPrice() {
        priceLabel.text = viewModel.getTotalPrice(100.0)
    }
    
    //MARK: - Actions
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        let createNewViewController = CreateNewPrizeViewController.instance(.createNewPrize)
        createNewViewController.delegate = self
        navigationController?.pushViewController(createNewViewController, animated: true)
    }

}

//MARK: CreateNewPrizeProtocol
extension PrizeListViewController: CreateNewPrizeProtocol {
    func addNewPrize(_ model: Prize) {
        tableView.reloadData() // test!!
    }

}
