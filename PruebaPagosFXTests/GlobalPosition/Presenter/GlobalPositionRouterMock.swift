import Foundation

@testable import PruebaPagosFX

class GlobalPositionRouterMock: GlobalPositionWireframeProtocol {
	var goToDetailCalled = false
	
	func goToDetail(for product: Product) {
		goToDetailCalled = true
	}
}
