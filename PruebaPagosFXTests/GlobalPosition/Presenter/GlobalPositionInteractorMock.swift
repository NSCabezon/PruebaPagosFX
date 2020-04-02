import Foundation

@testable import PruebaPagosFX

class GlobalPositionInteractorMock: GlobalPositionInteractorProtocol {
	var presenter: GlobalPositionPresenterProtocol?
	var getGlobalPositionCalled = false
	
	func getGlobalPosition() {
		getGlobalPositionCalled = true
	}
}
