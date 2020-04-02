//
//  Card.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation

class Card: Codable, Product {
	let pan: String
	var alias: String?
    let avalaible: Balance
	
	var id: String {
		return pan
	}
	
	var balance: Balance {
		return avalaible
	}
}
