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
            Text("Hello, word!")
                .toolbar {
                    
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me") {
                            
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Tap Me") {
                            
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
