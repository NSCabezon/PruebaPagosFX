//
//  SessionData.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation

struct SessionData {
	var token: String?
	var environment: Environment {
		didSet {
			safeprint("Environment \(environment.name) selected")
		}
	}
	
	static var shared = SessionData(token: nil, environment: Environment.defaultEnv())
}
