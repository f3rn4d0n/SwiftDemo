//
//  Logica.swift
//  DemoPlayground
//
//  Created by Luis Fernando Bustos Ramírez on 12/04/23.
//

import Foundation

struct Credentials {
    
    let email: String
    let password: String
}

struct Logica {
    
    func validateCredentials(email: String, password:String, stored: Bool) -> Bool {
        if email.count > 5 && email.contains("@") && !password.isEmpty {
            if stored {
                storeCredentials(email: email, password: password)
            } else {
                clearStoredCredentials()
            }
            return true
        } else {
            return false
        }
    }
    
    func clearStoredCredentials() {
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "password")
    }
    
    func storeCredentials(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
    }
    
    func getCredentials() -> Credentials {
        let email = UserDefaults.standard.string(forKey: "email") ?? ""
        let password = UserDefaults.standard.string(forKey: "password") ?? ""
        return Credentials(email: email, password: password)
    }
}
