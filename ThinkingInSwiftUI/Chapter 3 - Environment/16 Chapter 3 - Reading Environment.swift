//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct Knob3: View {
    @Binding var value: Double // should be between 0 and 1
    @Environment(\.colorScheme) var colorScheme // Works as @State but observing environment changes
    var body: some View {
         KnobShape()
            .fill(colorScheme == .dark ? Color.white : Color.black)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                withAnimation(.default) {
                    self.value = self.value < 0.5 ? 1 : 0
                }
            }
    }
}

struct ContentView16: View {
    @State var volume = 0.5
    var body: some View {
        VStack {
            Knob3(value: $volume)
                .frame(width: 100, height: 100)
        }
    }
}

struct ContentView16_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView16().preferredColorScheme(.light)
            ContentView16().preferredColorScheme(.dark)
        }
    }
}
