import UIKit

@testable import PruebaPagosFX

class GlobalPositionViewControllerMock:  GlobalPositionViewProtocol {
	var presenter: GlobalPositionPresenterProtocol?
	var didGetGPCalled = false
	var didFailToGetGPCalled = false
	
	func didGetGP(globalPosition: GlobalPosition) {
		didGetGPCalled = true
	}
	
	func didFailToGetGP() {
		didFailToGetGPCalled = true
	}
}
