import XCTest

@testable import PruebaPagosFX

class LoginInteractorTests: XCTestCase {
	var presenterMock: LoginPresenterMock!
	var interactor: LoginInteractor!
	var authRepository: AuthMockRepository!
	
	override func setUp() {
		authRepository = AuthMockRepository()
		presenterMock = LoginPresenterMock()
		interactor = LoginInteractor(authRepository: authRepository)
		interactor.presenter = presenterMock
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testLoginOk() {
		interactor?.login(with: "ok", and: "pass")
		XCTAssert(presenterMock.loginOkCalled)
	}
	
	func testLoginKo() {
		interactor?.login(with: "ko", and: "pass")
		XCTAssert(presenterMock.loginDidFailedCalled)
	}
}
