//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

// Second approach with custom pointer size environment value
struct Knob5: View {
    @Binding var value: Double // should be between 0 and 1
    var pointerSize: CGFloat? = nil
    @Environment(\.knobPointerSize) var envPointerSize
    @Environment(\.colorScheme) var colorScheme // Works as @State but observing environment changes
    var body: some View {
         KnobShape(pointerSize: pointerSize ?? envPointerSize)
            .fill(colorScheme == .dark ? Color.white : Color.black)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                withAnimation(.default) {
                    self.value = self.value < 0.5 ? 1 : 0
                }
            }
    }
}

struct ContentView18: View {
    @State var volume = 0.5
    var body: some View {
        VStack {
            Knob5(value: $volume)
                .frame(width: 100, height: 100)
                .knobPointerSize(0.2)
        }
    }
}

fileprivate struct PointerSizeKey: EnvironmentKey {
    static let defaultValue: CGFloat = 0.1
}

extension EnvironmentValues {
    var knobPointerSize: CGFloat {
        get { self[PointerSizeKey.self] }
        set { self[PointerSizeKey.self] = newValue }
    }
}

extension View {
    func knobPointerSize(_ size: CGFloat) -> some View {
        environment(\.knobPointerSize, size)
    }
}

struct ContentView18_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView18().preferredColorScheme(.light)
            ContentView18().preferredColorScheme(.dark)
        }
    }
}
