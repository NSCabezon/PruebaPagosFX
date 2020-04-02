import Foundation

// MARK: - Interactor

protocol LoginInteractorProtocol: class {
	var presenter: LoginPresenterProtocol? { get set }
	func login(with user: String, and password: String)
}

class LoginInteractor: LoginInteractorProtocol {
	
	weak var presenter: LoginPresenterProtocol?
	let authRepository: AuthProtocol
	
	init(authRepository: AuthProtocol = AuthRepository()) {
		self.authRepository = authRepository
	}
	
	func login(with user: String, and password: String) {
		let loginRequest = LoginRequest(user: user, password: password)
		authRepository.auth(with: loginRequest) { result in
			switch result {
			case .success(let response):
				SessionData.shared.token = response.token
				self.presenter?.loginOk()
			case .failure(let error):
				print(error)
				self.presenter?.loginDidFailed()
			}
		}
	}
}
