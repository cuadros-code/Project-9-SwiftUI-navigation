//
//  ContentView.swift
//  Project-9-SwiftUI-navigation
//
//  Created by Kevin Cuadros on 19/11/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int
//    @Binding var path: Int
    @Binding var path: NavigationPath

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home"){
//                    path.removeAll()
                    path = NavigationPath()
                }
            }
    }
}

struct ContentView: View {
    
//    @State private var path = [Int]()
    @State private var path = NavigationPath()
    
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
        .onChange(of: path) { oldValue, newValue in
            print(newValue)
        }
    }
}

#Preview {
    ContentView()
}
