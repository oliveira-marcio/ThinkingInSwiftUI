//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView54: View {
    @State var visible = false
    var body: some View {
        VStack {
            Button("Toggle") { self.visible.toggle() }
            if visible {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .transition(.slide)
            }
        }.animation(.default, value: visible)
    }
}

struct ContentView54_Previews: PreviewProvider {
    static var previews: some View {
        ContentView54()
    }
}
