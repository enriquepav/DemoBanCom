//
//  PostsView.swift
//  DemoBanCom
//
//  Created by MAC1DIGITAL20 on 7/03/23.
//

import SwiftUI

struct PostsView: View {
    
    @StateObject var viewModel = PostsViewModel()
    @State var posts = [Post]()
    
    
    var body: some View {
        
        
        NavigationView {
            List(viewModel.posts, id: \.userID) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                }
            }
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.getPosts(userId: 1)
    
                }
            }
        }
    }

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
