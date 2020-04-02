import UIKit

@testable import PruebaPagosFX

class LoginViewControllerMock:  LoginViewProtocol {
	var presenter: LoginPresenterProtocol?
	var hideGlobalSpinnerViewCalled = false
	var loginDidFailedCalled = false
	
	func hideGlobalSpinnerView() {
		hideGlobalSpinnerViewCalled = true
	}
	
	func loginDidFailed() {
		loginDidFailedCalled = true
	}
}
