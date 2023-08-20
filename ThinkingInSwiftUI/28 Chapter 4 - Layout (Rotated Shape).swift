//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView28: View {
    @State var rotation: Double = 0
    var body: some View {
        VStack {
            // Rotated shapes passes the proposed size on to its child, unchanged,
            // and it also returns that same size. In other words, it draws outside
            // of its bounds
            Rectangle()
                .rotation(.degrees(rotation))
                .fill(Color.red)
                .border(Color.blue)
                .frame(width: 100, height: 100)
            Slider(value: $rotation, in: 0...90)
                .padding()
        }
        .padding()
    }
}

struct ContentView28_Previews: PreviewProvider {
    static var previews: some View {
        ContentView28()
    }
}
