//
//  Environment.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation
import AlamofireMockable

enum Environment: EnvironmentInfo {
	case local
	case dev
	
	var name: String {
		switch self {
		case .local:
			return "local"
		case .dev:
			return "DEV"
		}
	}
	
	var baseURL: URL {
		switch self {
		case .local:
			return URL(string: "https://local.com")!
		case .dev:
			return URL(string: "https://dev-server-demos.herokuapp.com")!
		}
	}
}

