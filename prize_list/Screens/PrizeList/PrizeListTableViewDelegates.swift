//
//  PrizeListTableViewDelegates.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import UIKit

//MARK: - UITableViewDelegate
extension PrizeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prize = viewModel.dataArray[indexPath.row]
        let isSelected = prize.selectedIndex == Int.zero
        viewModel.updateCheckmark(prize: prize, isSelected: isSelected)
        setTotalPrice()
        guard let visibleIndexPaths = tableView.indexPathsForVisibleRows else {
            return
        }
        tableView.reloadRows(at: visibleIndexPaths, with: .none)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let object = viewModel.dataArray[indexPath.row]
            tableView.beginUpdates()
            RealmHelper.deleteObject(object: object)
            tableView.deleteRows(at: [indexPath], with: .left)
            setTotalPrice()
            setupEmptyState()
            tableView.endUpdates()
        }
    }
}

//MARK: - UITableViewDataSource
extension PrizeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PrizeCell.identifier, for: indexPath) as! PrizeCell
        cell.configureCell(by: viewModel.dataArray[indexPath.row])
        return cell
    }
    
    
}
