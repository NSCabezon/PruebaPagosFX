import Foundation

// MARK: - Presenter

protocol LoginPresenterProtocol: class {
	func login(with user: String, and password: String)
	func loginOk()
	func loginDidFailed()
	
	func switchValueChanged(isOn: Bool)
}

class LoginPresenter: LoginPresenterProtocol {
	
	weak private var view: LoginViewProtocol?
	var interactor: LoginInteractorProtocol?
	private let router: LoginWireframeProtocol
	
	init(interface: LoginViewProtocol, interactor: LoginInteractorProtocol?, router: LoginWireframeProtocol) {
		self.view = interface
		self.interactor = interactor
		self.router = router
	}
	
	func login(with user: String, and password: String) {
		interactor?.login(with: user, and: password)
	}
	
	func loginOk() {
		router.goToGlobalPosition()
	}
	
	func loginDidFailed() {
		view?.loginDidFailed()
	}
	
	func switchValueChanged(isOn: Bool) {
		interactor?.changeToLocalEnv(isLocal: isOn)
	}
}
