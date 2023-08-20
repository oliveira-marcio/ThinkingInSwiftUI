//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView6: View {
    var body: some View {
        VStack {
            ForEach(1...3, id: \.self) { x in
                Text("Item\(x)")
            }
        }
        .debug()
    }
}

struct ContentView6_Previews: PreviewProvider {
    static var previews: some View {
        ContentView6()
    }
}
