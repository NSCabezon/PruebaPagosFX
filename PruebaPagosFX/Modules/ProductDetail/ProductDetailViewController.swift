import UIKit

// MARK: - View

protocol ProductDetailViewProtocol: class {
	var presenter: ProductDetailPresenterProtocol? { get set }
	func configureUI(with product: Product)
}

class ProductDetailViewController: UIViewController, ProductDetailViewProtocol {
	
	var presenter: ProductDetailPresenterProtocol?
	
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var idTextField: UITextField!
	@IBOutlet weak var aliasLabel: UILabel!
	@IBOutlet weak var aliasTextField: UITextField!
	@IBOutlet weak var saveButton: UIButton! {
		didSet {
			saveButton.setTitle(localizedString("save_l"), for: .normal)
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		presenter?.viewDidLoad()
	}
	
	func configureUI(with product: Product) {
		switch product {
		case is Account:
			idLabel.text = localizedString("account_title")
		case is Card:
			idLabel.text = localizedString("card_title")
		default:
			idLabel.text = ""
		}
		idTextField.text = product.id
		aliasLabel.text = localizedString("alias_l")
		aliasTextField.text = product.alias
	}
	
	@IBAction func saveAliasAction(_ sender: Any) {
		presenter?.changeAlias(to: aliasTextField.text)
	}
	
	class func initFromStoryboard() -> ProductDetailViewController {
		if let viewController = UIStoryboard(name: "ProductDetail", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
			return viewController
		}
		assert(false)
		return ProductDetailViewController()
	}
}
