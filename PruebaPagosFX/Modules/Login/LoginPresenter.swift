import Foundation

// MARK: - Presenter

protocol LoginPresenterProtocol: class {
	func login(with user: String, and password: String)
	func loginOk()
	func loginDidFailed()
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
		view?.hideGlobalSpinnerView()
		// TODO: navigate to GP
	}
	
	func loginDidFailed() {
		view?.loginDidFailed()
	}
}
