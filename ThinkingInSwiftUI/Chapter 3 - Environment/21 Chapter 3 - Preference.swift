//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView21: View {
    var body: some View {
        NavigationView {
            Text("Hello!")
                .navigationTitle("Root View") // Pass the value up the tree view
        }
    }
}

struct ContentView21_Previews: PreviewProvider {
    static var previews: some View {
        ContentView21()
    }
}
