import Foundation

// MARK: - Wireframe

protocol InfoWireframeProtocol: class {
	
}

class InfoRouter: InfoWireframeProtocol {
	
	weak var viewController: InfoViewController?
	
	static func createModule() -> InfoViewController {
		// Change to get view from storyboard if not using progammatic UI
		let view = InfoViewController.initFromStoryboard()
		let interactor = InfoInteractor()
		let router = InfoRouter()
		let presenter = InfoPresenter(interface: view, interactor: interactor, router: router)
		
		view.presenter = presenter
		interactor.presenter = presenter
		router.viewController = view
		
		return view
	}
}
