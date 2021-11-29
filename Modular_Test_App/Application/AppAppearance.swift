//
//  AppAppearance.swift
//  Modular_Test_App
//
//  Created by 호세김 on 2021/11/29.
//

import Foundation
import UIKit

final class AppAppearance {
	
	static func setupAppearance() {
		
		// NavigationBar
		UINavigationBar.appearance().barTintColor = .black
		UINavigationBar.appearance().tintColor = .white
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		
		// TabBar
		UITabBar.appearance().tintColor = .white
	}
}
