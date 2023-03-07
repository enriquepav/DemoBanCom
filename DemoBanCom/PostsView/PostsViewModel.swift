//
//  PostsViewModel.swift
//  DemoBanCom
//
//  Created by MAC1DIGITAL20 on 7/03/23.
//

import Foundation

final class PostsViewModel : ObservableObject {
    
    @Published var posts : [Post] = []
   
    
    func getPosts(userId : Int) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/"+String(userId)+"/posts") else {
            print("error de url")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data , _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                
                let posts = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self?.posts = posts
                }
            }
            catch {
                print("data invalida")
            }
        }
        task.resume()
            
    }
   
    
}
