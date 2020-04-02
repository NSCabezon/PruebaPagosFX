import Foundation

// MARK: - Presenter

protocol InfoPresenterProtocol: class {
	
}

class InfoPresenter: InfoPresenterProtocol {
	
	weak private var view: InfoViewProtocol?
	var interactor: InfoInteractorProtocol?
	private let router: InfoWireframeProtocol
	
	init(interface: InfoViewProtocol, interactor: InfoInteractorProtocol?, router: InfoWireframeProtocol) {
		self.view = interface
		self.interactor = interactor
		self.router = router
	}
	
}
