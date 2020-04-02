import Foundation

// MARK: - Presenter

protocol ProductDetailPresenterProtocol: class {
	func viewDidLoad()
	func changeAlias(to alias: String?)
}

class ProductDetailPresenter: ProductDetailPresenterProtocol {
	
	weak private var view: ProductDetailViewProtocol?
	var interactor: ProductDetailInteractorProtocol?
	private let router: ProductDetailWireframeProtocol
	
	var product: Product
	weak var refreshDelegate: GlobalPositionRefreshProtocol?
	
	init(interface: ProductDetailViewProtocol, interactor: ProductDetailInteractorProtocol?, router: ProductDetailWireframeProtocol, product: Product) {
		self.view = interface
		self.interactor = interactor
		self.router = router
		self.product = product
	}
	
	func viewDidLoad() {
		view?.configureUI(with: product)
	}
	
	func changeAlias(to alias: String?) {
		if let account = product as? Account {
			account.alias = alias
		} else if let card = product as? Card {
			card.alias = alias
		}
		refreshDelegate?.refreshGlobalPosition()
	}
}
