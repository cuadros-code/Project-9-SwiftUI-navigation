//
//  ContentView.swift
//  Project-9-SwiftUI-navigation
//
//  Created by Kevin Cuadros on 19/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, word!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
