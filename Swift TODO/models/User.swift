//
//  User.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//

import Foundation

struct User: Codable{
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
