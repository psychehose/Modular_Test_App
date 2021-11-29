//
//  SceneDelegate.swift
//  Modular_Test_App
//
//  Created by 호세김 on 2021/11/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	let appDIContainer = AppDIContainer()
	var appCoordinator: AppFlowCoordinator?
	var window: UIWindow?
	
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		AppAppearance.setupAppearance()
		guard let windowScene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: windowScene)
		self.window = window

		window.rootViewController = LoginVC()
		window.backgroundColor = .white
		window.makeKeyAndVisible()
	}
	
	func sceneDidDisconnect(_ scene: UIScene) { }
	func sceneDidBecomeActive(_ scene: UIScene) { }
	func sceneWillResignActive(_ scene: UIScene) { }
	func sceneWillEnterForeground(_ scene: UIScene) { }
	func sceneDidEnterBackground(_ scene: UIScene) { }
}

