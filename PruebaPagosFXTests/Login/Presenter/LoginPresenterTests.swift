import XCTest

@testable import PruebaPagosFX

class LoginPresenterTests: XCTestCase {
	var presenter: LoginPresenter!
	var viewMock: LoginViewControllerMock!
	var interactorMock: LoginInteractorMock!
	var routerMock: LoginRouterMock!
	
	override func setUp() {
		viewMock = LoginViewControllerMock()
		interactorMock = LoginInteractorMock()
		routerMock = LoginRouterMock()
		presenter = LoginPresenter(interface: viewMock, interactor: interactorMock, router: routerMock)
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testLogin() {
		presenter.login(with: "user", and: "password")
		XCTAssert(interactorMock.loginCalled)
	}
	
	func testLoginOk() {
		presenter.loginOk()
		XCTAssert(routerMock.goToGlobalPositionCalled)
	}
	
	func testLoginDidFailed() {
		presenter.loginDidFailed()
		XCTAssert(viewMock.loginDidFailedCalled)
	}
	
	func testSwitchValueChangedOn() {
		presenter.switchValueChanged(isOn: true)
		XCTAssert(interactorMock.changeToLocalEnvCalled)
		XCTAssertNotNil(interactorMock.isLocal)
		if let isLocal = interactorMock.isLocal {
			XCTAssert(isLocal)
		} else {
			XCTAssert(false, "This should not happen")
		}
	}
	
	func testSwitchValueChangedOff() {
		presenter.switchValueChanged(isOn: false)
		XCTAssert(interactorMock.changeToLocalEnvCalled)
		XCTAssertNotNil(interactorMock.isLocal)
		if let isLocal = interactorMock.isLocal {
			XCTAssertFalse(isLocal)
		} else {
			XCTAssert(false, "This should not happen")
		}
	}
}
