//
//  User.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 01/07/21.
//

import Foundation

struct User: Decodable {
    
    let active: Bool?
    let fullname: String?
    let id: String?
    let username: String?
    
}

struct UserResponse: Decodable {
    
    let description: String
    let status_code: Int
    let data: User
    
}
