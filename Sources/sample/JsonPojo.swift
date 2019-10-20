//
//  jsonPojo.swift
//  COpenSSL
//
//  Created by Yabaze T on 20/10/19.
//

import Foundation

class Cool: Codable {
    let name: String
    let age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

