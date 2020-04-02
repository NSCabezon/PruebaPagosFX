import UIKit

// MARK: - View

protocol GlobalPositionViewProtocol: class {
	var presenter: GlobalPositionPresenterProtocol? { get set }
	func didGetGP(globalPosition: GlobalPosition)
	func didFailToGetGP()
}

class GlobalPositionViewController: UIViewController, GlobalPositionViewProtocol, View, GlobalPositionRefreshProtocol {
	
	var presenter: GlobalPositionPresenterProtocol?
	var globalPosition: GlobalPosition?
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureUI()
		presenter?.getGlobalPosition()
	}
	
	func configureUI() {
		tableView.registerNib(GPCellTableViewCell.self)
		let infoButton = UIButton(type: .infoLight)
		infoButton.addTarget(self, action: #selector(openInfoScreenAction), for: .touchUpInside)
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
	}
	
	func didGetGP(globalPosition: GlobalPosition) {
		self.globalPosition = globalPosition
		title = localizedString("hi_user", args: globalPosition.name)
		tableView.reloadData()
		hideGlobalSpinnerView()
	}
	
	func didFailToGetGP() {
		hideGlobalSpinnerView()
	}
	
	@objc func openInfoScreenAction() {
		presenter?.goToInfoScreen()
	}
	
	class func initFromStoryboard() -> GlobalPositionViewController {
		if let viewController = UIStoryboard(name: "GlobalPosition", bundle: nil).instantiateViewController(withIdentifier: "GlobalPositionViewController") as? GlobalPositionViewController {
			return viewController
		}
		assert(false)
		return GlobalPositionViewController()
	}
}

extension GlobalPositionViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let productHeader = ProductHeaderView.loadFromNib()
		productHeader.productNameLabel.text = globalPosition?.titleForObject(at: section)
		return productHeader
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 60
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return globalPosition?.globalPositionProducts.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return globalPosition?.globalPositionProducts[section].count ?? 0
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let product = globalPosition?.globalPositionProducts[indexPath.section][indexPath.row],
			let cell = tableView.dequeueReusableCell(cellType: GPCellTableViewCell.self) {
			cell.configure(with: product)
			return cell
		}
		safeprint("this should never happen")
		assert(false)
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		presenter?.goToProductDetail(at: indexPath)
	}
}

extension GlobalPositionViewController {
	func refreshGlobalPosition() {
		tableView.reloadData()
	}
}
