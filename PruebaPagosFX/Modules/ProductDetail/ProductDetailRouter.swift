import Foundation

// MARK: - Wireframe

protocol ProductDetailWireframeProtocol: class {
	
}

class ProductDetailRouter: ProductDetailWireframeProtocol {
	
	weak var viewController: ProductDetailViewController?
	
	static func createModule(product: Product, refreshDelegate: GlobalPositionRefreshProtocol) -> ProductDetailViewController {
		// Change to get view from storyboard if not using progammatic UI
		let view = ProductDetailViewController.initFromStoryboard()
		let interactor = ProductDetailInteractor()
		let router = ProductDetailRouter()
		let presenter = ProductDetailPresenter(interface: view, interactor: interactor, router: router, product: product)
		
		view.presenter = presenter
		interactor.presenter = presenter
		router.viewController = view
		
		presenter.refreshDelegate = refreshDelegate
		
		return view
	}
}
