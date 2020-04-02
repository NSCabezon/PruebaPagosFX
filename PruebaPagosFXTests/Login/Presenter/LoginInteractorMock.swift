import Foundation

@testable import PruebaPagosFX

class LoginInteractorMock: LoginInteractorProtocol {
	var presenter: LoginPresenterProtocol?
	var loginCalled = false
	
	func login(with user: String, and password: String) {
		loginCalled = true
	}
}
