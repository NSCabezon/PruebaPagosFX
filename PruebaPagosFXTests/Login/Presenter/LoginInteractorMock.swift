import Foundation

@testable import PruebaPagosFX

class LoginInteractorMock: LoginInteractorProtocol {
	var presenter: LoginPresenterProtocol?
	var loginCalled = false
	var changeToLocalEnvCalled = false
	
	func login(with user: String, and password: String) {
		loginCalled = true
	}
	
	func changeToLocalEnv(isLocal: Bool) {
		changeToLocalEnvCalled = true
	}
}
