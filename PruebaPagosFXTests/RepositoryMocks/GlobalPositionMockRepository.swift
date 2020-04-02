//
//  GlobalPositionMockRepository.swift
//  PruebaPagosFXTests
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation
import Alamofire

@testable import PruebaPagosFX

class GlobalPositionMockRepository: GPProtocol {
	var getGPCalled = false
	var returnSuccess = true
	
	func getGP(completion: @escaping (GlobalPositionResult) -> Void) {
		getGPCalled = true
		if returnSuccess {
			let gpObject = Mocks.load("globalPosition", as: GlobalPosition.self)
			completion(.success(gpObject))
		} else {
			completion(.failure(.parameterEncodingFailed(reason: .jsonEncodingFailed(error: APIError.genericError))))
		}
	}
}
