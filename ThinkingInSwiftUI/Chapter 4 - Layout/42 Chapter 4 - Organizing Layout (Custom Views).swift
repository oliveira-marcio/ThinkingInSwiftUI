//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct CircleWrapper<Content: View>: View {
    var foreground, background: Color
    var content: Content
    init(foreground: Color = .white,
         background: Color = .blue,
         @ViewBuilder content: () -> Content) {
        self.foreground = foreground
        self.background = background
        self.content = content()
    }
    var body: some View {
        Circle()
            .fill(background)
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(content.foregroundColor(foreground))
            .frame(width: 75, height: 75)
    }
}

struct ContentView42: View {
    var body: some View {
        CircleWrapper(foreground: .white, background: .gray) {
            Text("Hello")
        }
    }
}

struct ContentView42_Previews: PreviewProvider {
    static var previews: some View {
        ContentView42()
    }
}
