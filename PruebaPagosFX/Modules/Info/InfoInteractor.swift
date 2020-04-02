import Foundation

// MARK: - Interactor

protocol InfoInteractorProtocol: class {
	var presenter: InfoPresenterProtocol? { get set }
}

class InfoInteractor: InfoInteractorProtocol {
	
	weak var presenter: InfoPresenterProtocol?
}
