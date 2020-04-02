//
//  Product.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation

protocol Product {
	var id: String { get }
	var alias: String { get }
	var balance: Balance { get }
}
