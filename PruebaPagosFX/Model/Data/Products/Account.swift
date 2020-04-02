//
//  Account.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation

class Account: Codable, Product {
	let iban: String
	var alias: String?
    let balance: Balance
	
	var id: String {
		return iban
	}
	
    enum CodingKeys: String, CodingKey {
        case iban = "IBAN"
        case alias, balance
    }
}
