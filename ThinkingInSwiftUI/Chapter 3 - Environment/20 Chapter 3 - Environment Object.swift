//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

class DatabaseConnection: ObservableObject {
    @Published var isConnected = true
}

struct MyView: View {
    @EnvironmentObject var connection: DatabaseConnection
    var body: some View {
        VStack {
            if connection.isConnected {
                Text("Connected")
            }
        }
    }
}

struct ContentView20: View {
    var body: some View {
        NavigationView {
            MyView()
        } // Still preferred to use @Environment with EnvironmentKey when possible because it requires a default value
        .environmentObject(DatabaseConnection()) // If we remove this, app crashes
    }
}

struct ContentView20_Previews: PreviewProvider {
    static var previews: some View {
        ContentView20()
    }
}
