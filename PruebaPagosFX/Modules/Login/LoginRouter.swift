import Foundation

// MARK: - Wireframe

protocol LoginWireframeProtocol: class {
	
}

class LoginRouter: LoginWireframeProtocol {
	weak var viewController: LoginViewController?

	static func createModule() -> LoginViewController {
		// Change to get view from storyboard if not using progammatic UI
		let view = LoginViewController.initFromStoryboard()
		let interactor = LoginInteractor()
		let router = LoginRouter()
		let presenter = LoginPresenter(interface: view, interactor: interactor, router: router)

		view.presenter = presenter
		interactor.presenter = presenter
		router.viewController = view

		return view
	}
}
