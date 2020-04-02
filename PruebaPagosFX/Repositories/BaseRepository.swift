//
//  BaseRepository.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation
import AlamofireMockable
import Alamofire

class BaseRepository: NSObject {
	let manager: RequestManager
	
	internal init(manager: RequestManager = RequestManager(SessionData.shared.environment, mockingProtocol: MockingURLProtocol.self)) {
		self.manager = manager
	}
	
	func authHeader() -> HTTPHeaders {
		var headers: HTTPHeaders = [
			"Accept": "application/json"
		]
		if let token = SessionData.shared.token {
			headers.add(name: "tokenCredential", value: token)
		}
		return headers
	}
}
