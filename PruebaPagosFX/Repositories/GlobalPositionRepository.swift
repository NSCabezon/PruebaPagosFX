//
//  GlobalPositionRepository.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireMockable

typealias GlobalPositionResult = Swift.Result<GlobalPosition, AFError>

protocol GPProtocol {
	func getGP(completion: @escaping (GlobalPositionResult) -> Void)
}

class GlobalPositionRepository: BaseRepository, GPProtocol {
	let globalPositionPath = "globalposition"
	
	func getGP(completion: @escaping (GlobalPositionResult) -> Void) {
		manager.request(globalPositionPath, method: .get, encoding: JSONEncoding.default, headers: authHeader())
			.responseDecodable { (response: DataResponse<GlobalPosition, AFError>) in
				completion(response.result)
		}
	}
}
