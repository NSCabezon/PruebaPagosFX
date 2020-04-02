import Foundation

@testable import PruebaPagosFX

class LoginRouterMock: LoginWireframeProtocol {
	var goToGlobalPositionCalled = false
	
	func goToGlobalPosition() {
		goToGlobalPositionCalled = true
	}
}
