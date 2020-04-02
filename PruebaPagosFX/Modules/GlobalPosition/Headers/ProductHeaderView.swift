//
//  ProductHeaderView.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import UIKit

class ProductHeaderView: UIView, NibLoadable {
	
	@IBOutlet weak var productNameLabel: UILabel! {
		didSet {
			productNameLabel.textColor = UIColor.red
		}
	}
	
}
