//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView13: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .transformEnvironment(\.font) { dump($0) } // Gets environment values
        }
        .font(Font.headline) // Sets the environment and passes down the view tree
        .debug()
    }
}

struct ContentView13_Previews: PreviewProvider {
    static var previews: some View {
        ContentView13()
    }
}
