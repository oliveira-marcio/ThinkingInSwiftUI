//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView19: View {
    @State var volume = 0.5
    @State var balance = 0.5
    var body: some View {
        HStack {
            VStack {
                Text("Volume")
                Knob5(value: $volume)
                    .frame(width: 100, height: 100)
            }
            VStack {
                Text("Balance")
                Knob5(value: $balance)
                    .frame(width: 100, height: 100)
            }
        }
        .knobPointerSize(0.2) // It'll propagate to all children that reads this custom environment value
    }
}

struct ContentView19_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView19().preferredColorScheme(.light)
            ContentView19().preferredColorScheme(.dark)
        }
    }
}
