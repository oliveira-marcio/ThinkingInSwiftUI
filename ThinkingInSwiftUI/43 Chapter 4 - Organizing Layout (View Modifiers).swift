//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct CircleModifier: ViewModifier {
    var foreground = Color.white
    var background = Color.blue
    func body(content: Content) -> some View {
        Circle()
            .fill(background)
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(content.foregroundColor(foreground))
            .frame(width: 75, height: 75)
    }
}

struct ContentView43: View {
    var body: some View {
        Text("Hello").modifier(
            CircleModifier(foreground: .white, background: .gray)
        )
    }
}

struct ContentView43_Previews: PreviewProvider {
    static var previews: some View {
        ContentView43()
    }
}
