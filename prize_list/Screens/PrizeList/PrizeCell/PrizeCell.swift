//
//  PrizeCell.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import UIKit

final class PrizeCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var costLabel: UILabel!
    @IBOutlet private weak var checkmark: UIImageView!
    
    //MARK: - Cell reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
        costLabel.text = ""
        checkmark.isHidden = true
    }
    
    //MARK: - SetupCell
    func configureCell(by model: Prize) {
        nameLabel.text = model.name
        costLabel.text = model.cost.toDecimalPrice()
        checkmark.isHidden = model.selectedIndex == Int.zero
    }
    
}
