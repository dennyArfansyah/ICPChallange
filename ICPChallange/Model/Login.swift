//
//  Login.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 01/07/21.
//

struct LoginRequest: Encodable {
    
    let username: String
    let password: String
    
}

struct LoginResponse: Decodable {
    
    let description: String
    let status_code: Int
    let data: MainData
    
}
