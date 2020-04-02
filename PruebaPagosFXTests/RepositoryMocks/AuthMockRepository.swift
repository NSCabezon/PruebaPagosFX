//
//  AuthMockRepository.swift
//  PruebaPagosFXTests
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation
import Alamofire

@testable import PruebaPagosFX

class AuthMockRepository: AuthProtocol {
	var authCalled = false
	
	func auth(with user: LoginRequest, completion: @escaping (LoginResult) -> Void) {
		authCalled = true
		if user.user == "ok" {
			completion(.success(LoginResponse(token: "some random token")))
		} else {
			completion(.failure(.parameterEncodingFailed(reason: .jsonEncodingFailed(error: APIError.genericError))))
		}
	}
}
