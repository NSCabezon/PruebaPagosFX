import XCTest

@testable import PruebaPagosFX

class GlobalPositionInteractorTests: XCTestCase {
	var presenterMock: GlobalPositionPresenterMock!
	var interactor: GlobalPositionInteractor!
	var gpRepositoryMock: GlobalPositionMockRepository!
	
	override func setUp() {
		gpRepositoryMock = GlobalPositionMockRepository()
		presenterMock = GlobalPositionPresenterMock()
		interactor = GlobalPositionInteractor(gpRepository: gpRepositoryMock)
		interactor?.presenter = presenterMock
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testGetGlobalPositionOk() {
		gpRepositoryMock.returnSuccess = true
		interactor.getGlobalPosition()
		XCTAssert(presenterMock.didGetGPCalled)
	}
		
	func testGetGlobalPositionKo() {
		gpRepositoryMock.returnSuccess = false
		interactor.getGlobalPosition()
		XCTAssert(presenterMock.didFailToGetGPCalled)
	}
}
