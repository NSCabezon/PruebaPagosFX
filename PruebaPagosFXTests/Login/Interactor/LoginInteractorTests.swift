import XCTest

@testable import PruebaPagosFX

class LoginInteractorTests: XCTestCase {
	var presenterMock: LoginPresenterMock!
	var interactor: LoginInteractor!
	var authRepositoryMock: AuthProtocol!
	
	override func setUp() {
		authRepositoryMock = AuthMockRepository()
		presenterMock = LoginPresenterMock()
		interactor = LoginInteractor(authRepository: authRepositoryMock)
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
	
	func testChangeEnvToLocal() {
		XCTAssert(SessionData.shared.environment == Environment.defaultEnv())
		interactor.changeToLocalEnv(isLocal: true)
		XCTAssert(SessionData.shared.environment == .local)
	}
	
	func testChangeEnvToDev() {
		XCTAssert(SessionData.shared.environment == Environment.defaultEnv())
		interactor.changeToLocalEnv(isLocal: false)
		XCTAssert(SessionData.shared.environment == .dev)
	}
}
