//
//  Book.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 01/07/21.
//

import Foundation

struct Book: Decodable {
    
    let createdAt: Int
    let createdBy: User
    let name: String
    let description: String
    let id: String
    let deletedAt: Int?
    let modifiedAt: Int?
    let modifiedBy: User?
    
}

struct BooksResponse: Decodable {

    let description: String
    let status_code: Int
    let data: MainData
    
}

struct BookRequest: Encodable {
    
    let name: String
    let description: String
    
}

struct BookResponse: Decodable {

    let description: String
    let status_code: Int
    let data: Book
    
}

struct EditBookRequest: Encodable {
    
    let id: String
    let name: String
    let description: String
    
}
