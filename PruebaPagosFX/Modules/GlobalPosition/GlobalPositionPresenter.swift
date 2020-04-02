import Foundation

// MARK: - Presenter

protocol GlobalPositionPresenterProtocol: class {
	func getGlobalPosition()
	func didGetGP(globalPosition: GlobalPosition)
	func didFailToGetGP()
	func goToProductDetail(at indexPath: IndexPath)
}

class GlobalPositionPresenter: GlobalPositionPresenterProtocol {
	
	weak private var view: GlobalPositionViewProtocol?
	var interactor: GlobalPositionInteractorProtocol?
	private let router: GlobalPositionWireframeProtocol
	var globalPosition: GlobalPosition?
	
	init(interface: GlobalPositionViewProtocol, interactor: GlobalPositionInteractorProtocol?, router: GlobalPositionWireframeProtocol) {
		self.view = interface
		self.interactor = interactor
		self.router = router
	}
	
	func getGlobalPosition() {
		interactor?.getGlobalPosition()
	}
	
	func didGetGP(globalPosition: GlobalPosition) {
		self.globalPosition = globalPosition
		view?.didGetGP(globalPosition: globalPosition)
	}
	
	func didFailToGetGP() {
		// TODO: ask product what we should do, go back to login?
		view?.didFailToGetGP()
	}
	
	func goToProductDetail(at indexPath: IndexPath) {
		if let product = globalPosition?.globalPositionProducts[indexPath.section][indexPath.row] {
			router.goToDetail(for: product)
		}
	}
}
