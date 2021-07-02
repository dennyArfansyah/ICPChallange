//
//  LoginViewModel.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 01/07/21.
//

import Foundation
import Alamofire

struct LoginViewModel {
    
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func postLogin(with username: String, and password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        if username.count < 3 && password.count < 3 {
            completion(.failure(NSError(domain: "Username and Password must be filled", code: 1, userInfo: nil)))
            return
        }
        let url = URL(string: "https://test.incenplus.com/users/login")!
        let param = try! JSONEncoder().encode(LoginRequest(username: username, password: password))
        service.request(with: url, method: .post, parameter: param) { response in
            switch response {
            case .success(let data):
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    UserDefaults.standard.set(loginResponse.data.token, forKey: "token")
                    completion(.success(loginResponse))
                } catch {
                    completion(.failure(NSError(domain: error.localizedDescription, code: 1, userInfo: nil)))
                }
            case .failure(let err):
                let er = err as NSError
                completion(.failure(NSError(domain: er.domain, code: 1, userInfo: nil)))
            }
        }
    }
    
}
