//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView52: View {
    @State var selected: Bool = false
    var body: some View {
        Button(action: { self.selected.toggle() }) {
            RoundedRectangle(cornerRadius: 10)
                .fill(selected ? Color.red : .green)
                .frame(width: selected ? 100 : 50, height: selected ? 100 : 50)
        }.animation(.default, value: selected)
    }
}

struct ContentView52_Previews: PreviewProvider {
    static var previews: some View {
        ContentView52()
    }
}
