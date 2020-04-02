//
//  APIError.swift
//  PruebaPagosFXTests
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation

enum APIError: Error {
	case genericError
	
	var localizedDescription: String {
		switch self {
		case .genericError:
			return "Something went wrong"
		}
	}
}
