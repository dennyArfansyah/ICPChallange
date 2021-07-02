//
//  AccountViewModel.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 02/07/21.
//

import Foundation

class AccountViewModel {
    
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func getUserRequest(completion: @escaping (Result<UserResponse, Error>) -> Void) {
        let token = String(format: "https://test.incenplus.com/users/me?token=%@", UserDefaults.standard.string(forKey: "token")!)
        let url = URL(string: token)!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let loginResponse = try JSONDecoder().decode(UserResponse.self, from: data)
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
    
    func getLogoutReqeust(completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let token = String(format: "https://test.incenplus.com/books?token=%@", UserDefaults.standard.string(forKey: "token")!)
        let url = URL(string: token)!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
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
