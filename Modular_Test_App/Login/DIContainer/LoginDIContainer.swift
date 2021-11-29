//
//  LoginDIContainer.swift
//  Modular_Test_App
//
//  Created by 호세김 on 2021/11/29.
//

import Foundation
import UIKit

final class LoginDIContainer {
	struct Dependencies {
//		추후에 서버 연결할 떄 디펜던시 추가해주기
//		let apiDataTrasferService: DataTransferService
	}
	
	private let dependencies: Dependencies
	
	init(dependencies: Dependencies) {
		self.dependencies = dependencies
	}
	func makeLoginFlowCoordinator(navigationController: UINavigationController) -> LoginFlowCoordinator {
		return LoginFlowCoordinator(navigationController: navigationController, dependencies: self)
	}
	
	
}

extension LoginDIContainer: LoginFlowCoordinatorDependencies {}
