import XCTest

@testable import PruebaPagosFX

class GlobalPositionPresenterTests: XCTestCase {
	var presenter: GlobalPositionPresenter!
	var viewMock: GlobalPositionViewControllerMock!
	var interactorMock: GlobalPositionInteractorMock!
	var routerMock: GlobalPositionRouterMock!
	
	override func setUp() {
		viewMock = GlobalPositionViewControllerMock()
		interactorMock = GlobalPositionInteractorMock()
		routerMock = GlobalPositionRouterMock()
		presenter = GlobalPositionPresenter(interface: viewMock, interactor: interactorMock, router: routerMock)
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testGetGlobalPosition() {
		presenter.getGlobalPosition()
		XCTAssert(interactorMock.getGlobalPositionCalled)
	}
	
	func testDidGetGlobalPosition() {
		let globalPosition = Mocks.load("globalPosition", as: GlobalPosition.self)
		presenter.didGetGP(globalPosition: globalPosition)
		XCTAssertNotNil(presenter.globalPosition)
		XCTAssert(viewMock.didGetGPCalled)
	}
	
	func testDidFailToGetGlobalPosition() {
		presenter.didFailToGetGP()
		XCTAssert(viewMock.didFailToGetGPCalled)
	}
	
	func testGoToProductOk() {
		let globalPosition = Mocks.load("globalPosition", as: GlobalPosition.self)
		presenter.globalPosition = globalPosition
		presenter.goToProductDetail(at: IndexPath(row: 0, section: 0))
		XCTAssert(routerMock.goToDetailCalled)
	}
	
	func testGoToProductNilProduct() {
		presenter.goToProductDetail(at: IndexPath(row: 0, section: 0))
		XCTAssertFalse(routerMock.goToDetailCalled)
	}
}
