//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct Knob6: View {
    @Binding var value: Double // should be between 0 and 1
    var pointerSize: CGFloat? = nil
    @Environment(\.knobPointerSize) var envPointerSize
    @Environment(\.knobColor) var envColor
    @Environment(\.colorScheme) var colorScheme // Works as @State but observing environment changes
    private var fillColor: Color { envColor ?? (colorScheme == .dark ? Color.white : Color.black) }

    var body: some View {
        KnobShape(pointerSize: pointerSize ?? envPointerSize)
            .fill(fillColor)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                withAnimation(.default) {
                    self.value = self.value < 0.5 ? 1 : 0
                }
            }
    }
}

struct KnobView: View {
    let name: String
    @State var value = 0.5

    var body: some View {
        VStack {
            Text(name)
            Knob6(value: $value)
                .frame(width: 100, height: 100)
            Slider(value: $value, in: (0...1))
        }
        .padding()
    }
}

struct ContentView24: View {
    @State var useDefaultColor = true
    @State var hue: Double = 0

    var body: some View {
        VStack {
            HStack {
                KnobView(name: "Volume")
                KnobView(name: "Balance")
            }
            .knobColor(useDefaultColor
                       ? nil
                       : Color(hue: hue,
                               saturation: 1,
                               brightness: 1))
            HStack {
                Text("Color")
                Slider(value: $hue, in: 0...1)
            }
            Toggle(isOn: $useDefaultColor) {
                Text("Default Color")
            }
        }
        .padding()
    }
}

fileprivate struct ColorKey: EnvironmentKey {
    static let defaultValue: Color? = nil
}

extension EnvironmentValues {
    var knobColor: Color? {
        get { self[ColorKey.self] }
        set { self[ColorKey.self] = newValue }
    }
}

extension View {
    func knobColor(_ color: Color?) -> some View {
        environment(\.knobColor, color)
    }
}

struct ContentView24_Previews: PreviewProvider {
    static var previews: some View {
        ContentView24()
    }
}
