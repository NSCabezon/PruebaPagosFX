//
//  GlobalPositionPresenterMock.swift
//  PruebaPagosFXTests
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation

@testable import PruebaPagosFX

class GlobalPositionPresenterMock: GlobalPositionPresenterProtocol {
	var didFailToGetGPCalled = false
	var didGetGPCalled = false
	var getGlobalPositionCalled = false
	var goToProductDetailCalled = false
	
	func didFailToGetGP() {
		didFailToGetGPCalled = true
	}
	
	func didGetGP(globalPosition: GlobalPosition) {
		didGetGPCalled = true
	}
	
	func getGlobalPosition() {
		getGlobalPositionCalled = true
	}
	
	func goToProductDetail(at indexPath: IndexPath) {
		goToProductDetailCalled = true
	}
}
