//
//  AuthProtocol.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireMockable

typealias LoginResult = Swift.Result<LoginResponse, AFError>

protocol AuthProtocol {
	func auth(with user: LoginRequest, completion: @escaping (LoginResult) -> Void)
}

class AuthRepository: BaseRepository, AuthProtocol {
	let loginPath = "login"
	
	init(withEnv environment: Environment) {
		var mocking: URLProtocol.Type?
		if environment == .local {
			mocking = MockingURLProtocol.self
		}
		super.init(manager: RequestManager(environment, mockingProtocol: mocking))
	}
	
	func auth(with user: LoginRequest, completion: @escaping (LoginResult) -> Void) {
		manager.request(loginPath, method: .post, parameters: user, encoding: JSONEncoding.default, headers: nil)
			.responseDecodable { (response: DataResponse<LoginResponse, AFError>) in
				completion(response.result)
		}
	}
}
