//
//  LoginPresenterMock.swift
//  PruebaPagosFXTests
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation

@testable import PruebaPagosFX

class LoginPresenterMock: LoginPresenterProtocol {
	var loginCalled = false
	var loginOkCalled = false
	var loginDidFailedCalled = false
	var switchValueChangedCalled = false
	
	func login(with user: String, and password: String) {
		loginCalled = true
	}
	
	func loginOk() {
		loginOkCalled = true
	}
	
	func loginDidFailed() {
		loginDidFailedCalled = true
	}
	
	func switchValueChanged(isOn: Bool) {
		switchValueChangedCalled = true
	}
}
