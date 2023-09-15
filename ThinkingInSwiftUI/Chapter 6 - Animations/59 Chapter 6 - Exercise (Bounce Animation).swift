//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct Bounce: AnimatableModifier {
    var times: CGFloat = 0
    let amplitude: CGFloat = 30
    var animatableData: CGFloat {
        get { times }
        set { times = newValue }
    }
    func body(content: Content) -> some View {
        return content.offset(y: -abs(sin(times * .pi)) * amplitude)
    }
}

extension View {
    func bounce(times: Int) -> some View {
        return modifier(Bounce(times: CGFloat(times)))
    }
}

struct ContentView59: View {
    @State private var taps: Int = 0
    var body: some View {
        Button("Hello") {
            withAnimation(.linear(duration: 0.9)) {
                self.taps += 1
            }
        }
        .bounce(times: taps * 3)
    }
}

struct ContentView59_Previews: PreviewProvider {
    static var previews: some View {
        ContentView59()
    }
}
