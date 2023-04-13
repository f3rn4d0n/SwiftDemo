//
//  Logica.swift
//  DemoPlayground
//
//  Created by Luis Fernando Bustos Ramírez on 12/04/23.
//

import Foundation

struct Logica {
    
    func validateCredentials(email: String, password:String) -> Bool {
        if !email.isEmpty && !password.isEmpty {
            return true
        } else {
            return false
        }
    }
}
