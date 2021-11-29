//
//  AppDIContainer.swift
//  Modular_Test_App
//
//  Created by 호세김 on 2021/11/29.
//

// Feature Module, Network, Auth d


import Foundation

final class AppDIContainer {
	lazy var appConfiguration = AppConfiguration()
	
	func makeLoginContainer() ->  LoginDIContainer {
		let dependencies = LoginDIContainer.Dependencies()
		return LoginDIContainer(dependencies: dependencies)
	}
	// ... Module 1 추가
	
	// ... Module 2 Add
	
	// ... Network
	
	// ... Auth
	
}
