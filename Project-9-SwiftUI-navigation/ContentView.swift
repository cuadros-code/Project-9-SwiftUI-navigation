//
//  ContentView.swift
//  Project-9-SwiftUI-navigation
//
//  Created by Kevin Cuadros on 19/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                DetailView(number: 556)
            }
            
            List(0..<1000) { i in
                NavigationLink("Tap Me \(i)") {
                    DetailView(number: i)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
