//
//  AppCoordinator.swift
//  Modular_Test_App
//
//  Created by 호세김 on 2021/11/29.
//

import Foundation
import UIKit

final class AppFlowCoordinator {
	private weak var navigationController: UINavigationController?
	private let appDIContainer: AppDIContainer
	
	init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
		self.navigationController = navigationController
		self.appDIContainer = appDIContainer
	}
	
	// 여기서 플로우 설정해주는 듯.
	func start() {
		guard let navigationController = navigationController else {
			return
		}
		let loginDIContainer = appDIContainer.makeLoginContainer()
		let flow = loginDIContainer.
	}
}
