//
//  MainData.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 01/07/21.
//

import Foundation

struct MainData: Decodable {
    
    let token: String?
    let user: User?
    let books: [Book]?
}
