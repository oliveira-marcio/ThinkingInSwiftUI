//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView15: View {
    var body: some View {
        VStack {
            Text("Text 1")
            HStack {
                Text("Text 2")
                Text("Text 3") // Setting .font() in a Text, updates only the Text
            }
            .font(.largeTitle) // Setting .font() in a stack updates the environment
        }
    }
}

struct ContentView15_Previews: PreviewProvider {
    static var previews: some View {
        ContentView15()
    }
}
