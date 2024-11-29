# Navigation 

## Handling navigation the smart way with navigationDestination()

```swift
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
```

## Programmatic navigation with NavigationStack

```swift
import SwiftUI

struct ContentView: View {
    
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                Button("Show 32"){
                    path = [32]
                }
                Button("Show 64") {
                    path.append(64)
                }
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
} 
```

## Navigating to different data types using NavigationPath

```swift
struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected string \(selection)")
            }
        }
    }
}
```

## How to make a NavigationStack return to its root view programmatically

```swift
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

```
