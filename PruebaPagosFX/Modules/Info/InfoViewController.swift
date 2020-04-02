import UIKit

// MARK: - View

protocol InfoViewProtocol: class {
	var presenter: InfoPresenterProtocol? { get set }
}

class InfoViewController: UIViewController, InfoViewProtocol {
	let repoURL = URL(string: "https://github.com/NSCabezon/PruebaPagosFX")!
	
	var presenter: InfoPresenterProtocol?
	@IBOutlet weak var repoURLLabel: UILabel! {
		didSet {
			repoURLLabel.text = repoURL.absoluteString
		}
	}
	@IBOutlet weak var takeMeThereButton: UIButton! {
		didSet {
			takeMeThereButton.setTitle(localizedString("take_me_there"), for: .normal)
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	@IBAction func goToURLAction(_ sender: Any) {
		if UIApplication.shared.canOpenURL(repoURL) {
			UIApplication.shared.open(repoURL, options: [:], completionHandler: nil)
		}
	}
	
	class func initFromStoryboard() -> InfoViewController {
		if let viewController = UIStoryboard(name: "Info", bundle: nil).instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController {
			return viewController
		}
		assert(false)
		return InfoViewController()
	}
}
