import Foundation

// MARK: - Wireframe

protocol GlobalPositionWireframeProtocol: class {
	
}

class GlobalPositionRouter: GlobalPositionWireframeProtocol {
	
	weak var viewController: GlobalPositionViewController?
	
	static func createModule() -> GlobalPositionViewController {
		// Change to get view from storyboard if not using progammatic UI
		let view = GlobalPositionViewController.initFromStoryboard()
		let interactor = GlobalPositionInteractor()
		let router = GlobalPositionRouter()
		let presenter = GlobalPositionPresenter(interface: view, interactor: interactor, router: router)
		
		view.presenter = presenter
		interactor.presenter = presenter
		router.viewController = view
		
		return view
	}
}
