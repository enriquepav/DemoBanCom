//
//  LoginVM.swift
//  DemoBanCom
//
//  Created by MAC1DIGITAL20 on 5/03/23.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    
    func authenticateUser(username: String, password: String) -> Bool {
            if username.lowercased() == "bancomer@bancomer.com" {
                print("Wrong User")
                if password.lowercased() == "abc123" {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
}
