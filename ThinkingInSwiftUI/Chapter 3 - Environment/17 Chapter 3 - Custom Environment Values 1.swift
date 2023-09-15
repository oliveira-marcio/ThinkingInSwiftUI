//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

// First approach with pointer size constructor injection
struct Knob4: View {
    @Binding var value: Double // should be between 0 and 1
    var pointerSize: CGFloat = 0.1
    @Environment(\.colorScheme) var colorScheme // Works as @State but observing environment changes
    var body: some View {
         KnobShape(pointerSize: pointerSize)
            .fill(colorScheme == .dark ? Color.white : Color.black)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                withAnimation(.default) {
                    self.value = self.value < 0.5 ? 1 : 0
                }
            }
    }
}

struct ContentView17: View {
    @State var volume = 0.5
    var body: some View {
        VStack {
            Knob4(value: $volume, pointerSize: 0.2)
                .frame(width: 100, height: 100)
        }
    }
}

struct ContentView17_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView17().preferredColorScheme(.light)
            ContentView17().preferredColorScheme(.dark)
        }
    }
}
