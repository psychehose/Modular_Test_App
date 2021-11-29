//
//  AuthenticationDIContainer.swift
//  Modular_Test_App
//
//  Created by 호세김 on 2021/11/29.
//

import Alamofire

public struct AuthNetworkRequest {
	let request: DataRequest
	
	public func cancel() {
		request.cancel()
		
	}
}

public final class AuthNetworkSessionManager {
	private let sessionManager: Session
	private var authHandler = AuthHandler()
	
	// TODO: - create and inject AuthConfiguration and AuthDelegate to notify when login is needed
	
	public init(sessionManager: Session = Session()) {
		self.sessionManager = sessionManager
	}
	
}
final class AuthHandler: RequestInterceptor {
	func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
		// MARK: - Access Token 더하기
	}
	
	func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
		// MARK: - Refresh Token으로 Access Token 재발행하기
	}
	
	
}
