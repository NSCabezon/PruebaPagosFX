import Foundation

// MARK: - Interactor

protocol GlobalPositionInteractorProtocol: class {
	var presenter: GlobalPositionPresenterProtocol? { get set }
	func getGlobalPosition()
}

class GlobalPositionInteractor: GlobalPositionInteractorProtocol {
	
	weak var presenter: GlobalPositionPresenterProtocol?
	var gpRepository: GPProtocol
	
	init(gpRepository: GPProtocol = GlobalPositionRepository()) {
		self.gpRepository = gpRepository
	}
	
	func getGlobalPosition() {
		gpRepository.getGP { gpResult in
			switch gpResult {
			case .success(let globalPosition):
				self.presenter?.didGetGP(globalPosition: globalPosition)
			case .failure(let error):
				safeprint(error)
				self.presenter?.didFailToGetGP()
			}
		}
	}
}
