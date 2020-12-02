//
//  PrizeListViewModel.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import Foundation

final class PrizeListViewModel {
    
    //MARK: Property
    private var selectedIndex = 0
    var purchaseLimit = 100.0
    var dataArray: [Prize] {
        RealmHelper.getObjects()
    }
    private var selectedPrize: [Prize] {
        dataArray.filter {$0.selectedIndex != 0}
    }
    private var totalPrice: Double {
        selectedPrize.map {$0.cost}.reduce(0, +)
    }
    
    //MARK: - Funcs
    func updateCheckmark(prize: Prize, isSelected: Bool) {
        let newPrize = Prize()
        newPrize.name = prize.name
        newPrize.cost = prize.cost
        newPrize.id = prize.id
        newPrize.createdAt = prize.createdAt
        newPrize.selectedIndex = isSelected ? Int(Date().timeIntervalSince1970) : Int.zero
        RealmHelper.saveObject(object: newPrize)
    }
    
    func getTotalPrice() -> String {
        guard !selectedPrize.isEmpty else {
            return Double.zero.toDecimalPrice()
        }
        let sortedPrizes = dataArray.sorted { $0.selectedIndex < $1.selectedIndex }
        
        for prize in sortedPrizes {
            if totalPrice > purchaseLimit {
                updateCheckmark(prize: prize, isSelected: false)
            } else {
                break
            }
        }
        return totalPrice.toDecimalPrice()
    }
    
    func isEmptyState() -> Bool {
        return dataArray.isEmpty
    }
    
}
