//
//  LoginResponse.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation

struct LoginResponse: Decodable {
	let token: String
	
	enum CodingKeys: String, CodingKey {
		case token = "tokenCredential"
	}
}
