import Foundation

// MARK: - Interactor

protocol LoginInteractorProtocol: class {
	var presenter: LoginPresenterProtocol? { get set }
	func login(with user: String, and password: String)
	func changeToLocalEnv(isLocal: Bool)
}

class LoginInteractor: LoginInteractorProtocol {
	
	weak var presenter: LoginPresenterProtocol?
	var authRepository: AuthProtocol
	
	init(authRepository: AuthProtocol) {
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
				safeprint(error)
				self.presenter?.loginDidFailed()
			}
		}
	}
	
	func changeToLocalEnv(isLocal: Bool) {
		var env = Environment.dev
		if isLocal {
			env = .local
		}
		
		SessionData.shared.environment = env
		authRepository = AuthRepository(withEnv: env)
	}
}
