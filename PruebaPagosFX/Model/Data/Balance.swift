//
//  Balance.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import UIKit

struct Balance: Codable {
    let value, currency: String
	
	// TODO: waiting for design to tell us the exact colors or how it will differenciate
	func asAttrString() -> NSAttributedString? {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.currencyCode = currency
		let decimalValue = Decimal(string: value)
		guard let string = formatter.string(from: (decimalValue ?? 0) as NSNumber) else { return nil }
		var color = UIColor.blue
		if decimalValue?.doubleValue ?? 0 < 0 {
			color = .red
		}
		return NSAttributedString(string: string, attributes: [NSAttributedString.Key.foregroundColor: color])
	}
}
