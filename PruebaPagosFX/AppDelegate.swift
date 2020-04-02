//
//  AppDelegate.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let env = Environment.defaultEnv()
		SessionData.shared.environment = env
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = UINavigationController(rootViewController: LoginRouter.createModule(environment: env))
		window?.makeKeyAndVisible()
		
		configureIQKeyboard()
		return true
	}
	
	func configureIQKeyboard() {
		IQKeyboardManager.shared.enable = true
		IQKeyboardManager.shared.enableAutoToolbar = false
		IQKeyboardManager.shared.previousNextDisplayMode = .alwaysShow
		IQKeyboardManager.shared.shouldResignOnTouchOutside = true
	}
	
}

