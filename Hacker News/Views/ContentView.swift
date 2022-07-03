//
//  ContentView.swift
//  Hacker News
//
//  Created by Francisco Donadio on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networokManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networokManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear {
            self.networokManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//]
