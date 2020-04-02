//
//  GlobalPosition.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation

struct GlobalPosition: Codable {
    let name: String
    let accounts: [Account]
    let cards: [Card]
	
	func titleForObject(at section: Int) -> String {
		let product = globalPositionProducts[section][0]
		switch product {
		case is Account:
			return localizedString("account_section_title")
		case is Card:
			return localizedString("card_section_title")
		default:
			safeprint("Product \(product) not recognized")
			return ""
		}
	}
	
	// TODO: move logic to GP view object when we create it
	var globalPositionProducts: [[Product]] {
		var productsArray = [[Product]]()
		if !accounts.isEmpty {
			productsArray.append(accounts)
		}
		if !cards.isEmpty {
			productsArray.append(cards)
		}
		return productsArray
	}
}
