//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView56: View {
    @State var selected: Bool = false
    var body: some View {
        VStack {
            Button(action: {
                // Animation will only happen from this action not the state change
                withAnimation {
                    self.selected.toggle()
                }
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(selected ? Color.red : .green)
                    .frame(width: selected ? 100 : 50, height: selected ? 100 : 50)
            }
            Button("Toggle") { self.selected.toggle() }
        }
    }
}

struct ContentView56_Previews: PreviewProvider {
    static var previews: some View {
        ContentView56()
    }
}
