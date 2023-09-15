//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct KnobShape: Shape {
    var pointerSize: CGFloat = 0.1 // these are relative values
    var pointerWidth: CGFloat = 0.1
    func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * self.pointerWidth
        let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)
        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight + 2))
        }
    }
}

// Using callbacks to update parent state
struct Knob1: View {
    var value: Double // should be between 0 and 1
    var valueChanged: (Double) -> ()

    var body: some View {
         KnobShape()
            .fill(Color.gray)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                withAnimation(.default) {
                    self.valueChanged(self.value < 0.5 ? 1 : 0)
                }
            }
    }
}

struct ContentView9: View {
    @State var volume = 0.5
    var body: some View {
        VStack {
            Knob1(value: volume) { self.volume = $0 }
                .frame(width: 100, height: 100)
            Slider(value: $volume, in: (0...1)) // Slider receives a Binding to read and update it
        }
    }
}

struct ContentView9_Previews: PreviewProvider {
    static var previews: some View {
        ContentView9()
    }
}
