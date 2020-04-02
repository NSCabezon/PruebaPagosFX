import UIKit

// MARK: - View

protocol LoginViewProtocol: class {
	var presenter: LoginPresenterProtocol? { get set }
	
	func loginDidFailed()
}

class LoginViewController: UIViewController, LoginViewProtocol, View {
	
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
	@IBOutlet weak var loginButton: UIButton! {
		didSet {
			loginButton.setTitle(localizedString("log_in"), for: .normal)
		}
	}
	@IBOutlet weak var localEnvSwitchContentView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = localizedString("login_nav_title")
		
		#if DEBUG
		localEnvSwitchContentView.isHidden = false
		
		// For quicker login in purposes
		userTextfield.text = "50289527G"
		passwordTextfield.text = "1234"
		#endif
	}
	
	@IBAction func loginAction(_ sender: Any) {
		guard let user = userTextfield.text,
			user != "" else {
				presentErrorAlert(message: localizedString("user_mandatory"), acceptCompletion: { _, _ in
					self.userTextfield.becomeFirstResponder()
				})
			return
		}
		guard let password = passwordTextfield.text,
			password != "" else {
			presentErrorAlert(message: localizedString("password_mandatory"), acceptCompletion: { _, _ in
				self.passwordTextfield.becomeFirstResponder()
			})
			return
		}
		view.endEditing(true)
		showGlobalSpinnerView()
		presenter?.login(with: user, and: password)
	}
	
	func loginDidFailed() {
		hideGlobalSpinnerView()
		presentErrorAlert(message: localizedString("login_failed"))
	}
	
	@IBAction func localEnvValueChanged(_ sender: UISwitch) {
		presenter?.switchValueChanged(isOn: sender.isOn)
	}
	
	class func initFromStoryboard() -> LoginViewController {
		if let viewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
			return viewController
		}
		assert(false)
		return LoginViewController()
	}
}
