//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

extension View {
    func circle(foreground: Color = .white, background: Color = .blue)
    -> some View {
        Circle()
            .fill(background)
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(self.foregroundColor(foreground))
        .frame(width: 75, height: 75)}
}

struct ContentView41: View {
    var body: some View {
        Text("Hello")
            .circle(foreground: .white, background: .gray)
    }
}

struct ContentView41_Previews: PreviewProvider {
    static var previews: some View {
        ContentView41()
    }
}
