//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView33: View {
    var body: some View {
        HStack {
            Circle().fill(Color.red)
            // Ddoes not affect the layout, just draw at differet position
            Circle().fill(Color.blue).offset(y: -30)
            Circle().fill(Color.green)
        }
        .frame(width: 200, height: 60)
        .border(.gray)
    }
}

struct ContentView33_Previews: PreviewProvider {
    static var previews: some View {
        ContentView33()
    }
}
