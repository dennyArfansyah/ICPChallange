//
//  HomeViewModel.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 02/07/21.
//

import UIKit

class ListViewModel {
    
    private let service: ServiceProtocol
    var books = [Book]()
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func getBooks(completion: @escaping (Result<BooksResponse, Error>) -> Void) {
        let token = String(format: "https://test.incenplus.com/books?token=%@", UserDefaults.standard.string(forKey: "token")!)
        let url = URL(string: token)!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let booksResponse = try JSONDecoder().decode(BooksResponse.self, from: data)
                    completion(.success(booksResponse))
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
