//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct StackView1: View {
    let alignment: VerticalAlignment

    var body: some View {
        HStack(alignment: alignment) {
            Rectangle().fill(Color.blue)
                .frame(width: 50, height: 50)
            Rectangle().fill(Color.green)
                .frame(width: 30, height: 30)
            Rectangle().fill(Color.red)
                .frame(width: 40, height: 40)
        }.border(Color.black)
    }
}

struct ContentView39: View {
    var body: some View {
        VStack {
            StackView1(alignment: .top)
            StackView1(alignment: .center)
            StackView1(alignment: .bottom)
        }
    }
}

struct ContentView39_Previews: PreviewProvider {
    static var previews: some View {
        ContentView39()
    }
}
