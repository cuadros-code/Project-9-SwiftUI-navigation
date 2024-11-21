//
//  ContentView.swift
//  Project-9-SwiftUI-navigation
//
//  Created by Kevin Cuadros on 19/11/24.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }.navigationDestination(for: Int.self) { selection in
                Text("Selection \(selection)")
            }
            .navigationDestination(for: Student.self) { student in
                Text("Selection \(student.name)")
            }
        }
    }
}

#Preview {
    ContentView()
}
