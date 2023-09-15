//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct Blur: ViewModifier {
    var active: Bool
    func body(content: Content) -> some View {
        return content
            .blur(radius: active ? 50 : 0)
            .opacity(active ? 0 : 1)
    }
}

extension AnyTransition {
    static var blur: AnyTransition {
        .modifier(active: Blur(active: true),
                  identity: Blur(active: false))
    }
}

struct ContentView58: View {
    @State private var visible: Bool = false
    var body: some View {
        VStack {
            Button("Toggle") { self.visible.toggle() }
            if visible {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .transition(.blur)
            }
        }.animation(.default, value: visible)
    }
}

struct ContentView58_Previews: PreviewProvider {
    static var previews: some View {
        ContentView58()
    }
}
