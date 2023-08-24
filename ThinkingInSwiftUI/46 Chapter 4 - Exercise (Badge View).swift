//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

extension View {
    func badge(count: Int) -> some View {
        overlay(
            ZStack {
                if count != 0 {
                    Circle()
                        .fill(Color.red)
                    Text("\(count)")
                        .foregroundColor(.white)
                        .font(.caption)
                }
            }
                .offset(x: 12, y: -12)
                .frame(width: 24, height: 24)
            , alignment: .topTrailing)
    }
}

struct ContentView46: View {
    var body: some View {
        VStack {
            Text("Hello")
                .padding(10)
                .background(.gray)
                .badge(count: 5)
                .padding()
            Text("Hello")
                .padding(10)
                .background(.gray)
                .badge(count: 0)

        }
    }
}

struct ContentView46_Previews: PreviewProvider {
    static var previews: some View {
        ContentView46()
    }
}
