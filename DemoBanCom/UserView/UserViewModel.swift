//
//  UserViewModel.swift
//  DemoBanCom
//
//  Created by MAC1DIGITAL20 on 6/03/23.
//

import Foundation

final class UsersViewModel : ObservableObject {
    
    
   
    
    func getUsers(completed: @escaping([User]) -> Void) {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let users = try JSONDecoder().decode([User].self, from: data)
                        completed(users)
                    } catch let error {
                        print(error)
                    }
                    
                }
            }.resume()
        }
        
    }
}
