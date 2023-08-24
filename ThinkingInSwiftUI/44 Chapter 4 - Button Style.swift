//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct CircleStyle: ButtonStyle {
    var foreground = Color.white
    var background = Color.blue
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        Circle()
            .fill(background.opacity(configuration.isPressed ? 0.8 : 1))
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(configuration.label.foregroundColor(foreground))
            .frame(width: 75, height: 75)
    }
}

struct ContentView44: View {
    // Necause styles modify the environment, it can be applied to the parent view
    var body: some View {
        VStack {
            Button("One", action: {})
            Button("Two", action: {})
            Button("Three", action: {})
        }
        .buttonStyle(CircleStyle())
    }
}

struct ContentView44_Previews: PreviewProvider {
    static var previews: some View {
        ContentView44()
    }
}
