//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView14: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .transformEnvironment(\.font) { dump($0) } // Gets environment values
        }
        .environment(\.font, Font.headline) // Does the same as .font(...)
        .debug()
    }
}

struct ContentView14_Previews: PreviewProvider {
    static var previews: some View {
        ContentView14()
    }
}
