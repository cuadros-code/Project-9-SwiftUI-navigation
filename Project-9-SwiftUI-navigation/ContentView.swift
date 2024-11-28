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
    
    var students: [Student] = [
        Student(name: "Kevin", age: 25),
        Student(name: "Julio", age: 37)
    ]
    
    var body: some View {
        NavigationStack {
            List(students, id: \.id) { i in
                NavigationLink("Select \(i.name)", value: i)
            }.navigationDestination(for: Student.self) { student in
                Text("Name \(student.name)")
                Text("Age \(student.age)")
            }
            
            List(0..<5) { i in
                NavigationLink("Select \(i)", value: i)
            }.navigationDestination(for: Int.self) { selection in
                Text("Selection \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
