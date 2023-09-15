//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct AnimatedButton: View {
    let animation: Animation
    @Binding var selected: Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.green)
            .frame(width: selected ? 200 : 50, height: 50)
            .animation(animation, value: selected)
    }
}

struct ContentView55: View {
    @State var selected: Bool = false
    var body: some View {
        VStack {
            AnimatedButton(animation: .default,
                           selected: $selected)
            AnimatedButton(animation: .linear(duration: 2),
                           selected: $selected)
            AnimatedButton(animation: .linear(duration: 1).repeatCount(2),
                           selected: $selected)
            AnimatedButton(animation: .linear(duration: 1).repeatCount(2, autoreverses: false),
                           selected: $selected)
            AnimatedButton(animation: .easeIn(duration: 2),
                           selected: $selected)
            Button("Toggle") { self.selected.toggle() }
        }
    }
}

struct ContentView55_Previews: PreviewProvider {
    static var previews: some View {
        ContentView55()
    }
}
