//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

// Using Binding to update parent state
struct Knob2: View {
    @Binding var value: Double // should be between 0 and 1
    var body: some View {
         KnobShape()
            .fill(Color.gray)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                withAnimation(.default) {
                    self.value = self.value < 0.5 ? 1 : 0
                }
            }
    }
}

struct ContentView10: View {
    @State var volume = 0.5
    var body: some View {
        VStack {
            Knob2(value: $volume)
                .frame(width: 100, height: 100)
            Slider(value: $volume, in: (0...1)) // Slider receives a Binding to read and update it
        }
    }
}

struct ContentView10_Previews: PreviewProvider {
    static var previews: some View {
        ContentView10()
    }
}
