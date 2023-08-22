//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView36: View {
    var body: some View {
        VStack {
            Rectangle()
                .rotation(.degrees(45))
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .border(.gray)
                .padding(40)
            Rectangle()
                .rotation(.degrees(45))
                .fill(Color.red)
                .clipped() // clips the view to its bounding rectangle
                .frame(width: 100, height: 100)
                .border(.gray)
                .padding(40)
            Rectangle()
                .rotation(.degrees(45))
                .fill(Color.red)
                .clipShape(Triangle()) // clips the view to a shape
                .frame(width: 100, height: 100)
                .border(.gray)
                .padding(40)
            Rectangle()
                .fill(Gradient(colors: [.red, .blue]))
                .mask {
                    Text("SWIFT!")
                        .font(.system(size: 72))
                }
                .frame(height: 72)
                .border(.gray)
        }
    }
}

struct ContentView36_Previews: PreviewProvider {
    static var previews: some View {
        ContentView36()
    }
}
