import UIKit

// MARK: - View

protocol LoginViewProtocol: View {
	var presenter: LoginPresenterProtocol? { get set }
	
	func loginDidFailed()
}

class LoginViewController: UIViewController, LoginViewProtocol {
	
	var presenter: LoginPresenterProtocol?
	
	@IBOutlet weak var userLabel: UILabel! {
		didSet {
			userLabel.text = localizedString("user_hint")
		}
	}
	@IBOutlet weak var userTextfield: UITextField!
	@IBOutlet weak var passwordLabel: UILabel! {
		   didSet {
			   passwordLabel.text = localizedString("pass_hint")
		   }
	   }
	@IBOutlet weak var passwordTextfield: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		userTextfield.text = "50289527G"
		passwordTextfield.text = "1234"
	}
	
	@IBAction func loginAction(_ sender: Any) {
		guard let user = userTextfield.text else {
			presentErrorAlert(message: localizedString("user_mandatory"), viewController: self)
			return
		}
		guard let password = passwordTextfield.text else {
			presentErrorAlert(message: localizedString("password_mandatory"), viewController: self)
			return
		}
		view.endEditing(true)
		showGlobalSpinnerView()
		presenter?.login(with: user, and: password)
	}
	
	func loginDidFailed() {
		presentErrorAlert(message: localizedString("login_failed"), viewController: self)
	}
	
	class func initFromStoryboard() -> LoginViewController {
		if let viewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
			return viewController
		}
		assert(false)
		return LoginViewController()
	}
}
