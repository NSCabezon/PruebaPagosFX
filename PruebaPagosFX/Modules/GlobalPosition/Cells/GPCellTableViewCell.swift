//
//  GPCellTableViewCell.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import UIKit

class GPCellTableViewCell: UITableViewCell {

	@IBOutlet weak var productNameLabel: UILabel!
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var balanceLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func configure(with product: Product) {
		productNameLabel.text = product.alias
		idLabel.text = product.id
		balanceLabel.attributedText = product.balance.asAttrString()
	}
}
