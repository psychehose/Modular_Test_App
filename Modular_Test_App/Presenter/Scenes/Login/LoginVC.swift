//
//  ViewController.swift
//  Modular_Test_App
//
//  Created by 호세김 on 2021/11/26.
//
import AuthenticationServices
import UIKit

import SnapKit


final class LoginVC: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		setupProviderLoginView()
	}
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		performExistingAccountSetupFlows()
	}
}

extension LoginVC {
	private func setupProviderLoginView() {
		let authorizationButton = ASAuthorizationAppleIDButton()
		authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
		view.addSubview(authorizationButton)
		authorizationButton.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview().offset(100)
		}
	}
	func performExistingAccountSetupFlows() {
		// Prepare requests for both Apple ID and password providers.
		let requests = [ASAuthorizationAppleIDProvider().createRequest(),
										ASAuthorizationPasswordProvider().createRequest()]
		
		// Create an authorization controller with the given requests.
		let authorizationController = ASAuthorizationController(authorizationRequests: requests)
		authorizationController.delegate = self
		authorizationController.presentationContextProvider = self
		authorizationController.performRequests()
	}
	
	private func saveUserIDInKeychain(_ userIdentifier: String) {
		do {
			try KeychainItem(service: "Triplenine-Holdings.Modular-Test-App", account: "userIdentifier").saveItem(userIdentifier)
		} catch {
			print("Unable to save userIdentifier to keychain.")
		}
	}
	private func showPasswordCredentialAlert(username: String, password: String) {
		let message = "The app has received your selected credential from the keychain. \n\n Username: \(username)\n Password: \(password)"
		let alertController = UIAlertController(title: "Keychain Credential Received",
																						message: message,
																						preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
		self.present(alertController, animated: true, completion: nil)
	}
}


extension LoginVC {
	@objc
	func handleAuthorizationAppleIDButtonPress() {
		let appleIDProvider = ASAuthorizationAppleIDProvider()
		let request = appleIDProvider.createRequest()
		request.requestedScopes = [.fullName, .email]
		
		let authorizationController = ASAuthorizationController(authorizationRequests: [request])
		authorizationController.delegate = self
		authorizationController.presentationContextProvider = self
		authorizationController.performRequests()
	}
	
}

extension LoginVC: ASAuthorizationControllerDelegate {
	func authorizationController(
		controller: ASAuthorizationController,
		didCompleteWithAuthorization authorization: ASAuthorization
	){
		switch authorization.credential {
		case let appleIDCredential as ASAuthorizationAppleIDCredential:
			let userIdentifier = appleIDCredential.user
			let fullName = appleIDCredential.fullName
			let email = appleIDCredential.email
			
			saveUserIDInKeychain(userIdentifier)
			print("apple ID Credential")
			print("user FullName: \(fullName), email:\(email), userIdentifier: \(userIdentifier)")
		case let passwordCredential as ASPasswordCredential:
			let username = passwordCredential.user
			let password = passwordCredential.password
			
			print("apple password Credential")
			print("user: \(username), pass: \(password)")
			
			DispatchQueue.main.async {
				self.showPasswordCredentialAlert(username: username, password: password)
			}
			
		default:
			break
		}
	}
}
extension LoginVC: ASAuthorizationControllerPresentationContextProviding {
	func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
		return self.view.window!
	}
}
