import Foundation

// MARK: - Wireframe

protocol LoginWireframeProtocol: class {
	func goToGlobalPosition()
}

class LoginRouter: LoginWireframeProtocol {
	weak var viewController: LoginViewController?

	static func createModule(environment: Environment) -> LoginViewController {
		// Change to get view from storyboard if not using progammatic UI
		let view = LoginViewController.initFromStoryboard()
		let interactor = LoginInteractor(authRepository: AuthRepository(withEnv: environment))
		let router = LoginRouter()
		let presenter = LoginPresenter(interface: view, interactor: interactor, router: router)

		view.presenter = presenter
		interactor.presenter = presenter
		router.viewController = view

		return view
	}
	
	func goToGlobalPosition() {
		let globalPositionVC = GlobalPositionRouter.createModule()
		viewController?.navigationController?.pushViewController(globalPositionVC, animated: true)
	}
}
