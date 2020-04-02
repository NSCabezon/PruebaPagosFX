import Foundation

// MARK: - Interactor

protocol ProductDetailInteractorProtocol: class {
	var presenter: ProductDetailPresenterProtocol? { get set }
}

class ProductDetailInteractor: ProductDetailInteractorProtocol {
	
	weak var presenter: ProductDetailPresenterProtocol?
}
