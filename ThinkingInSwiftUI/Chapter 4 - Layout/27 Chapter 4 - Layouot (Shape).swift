//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

// Shape is a Path that fit or fill the proposed size.
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { p in
            p.move(to: CGPoint(x: rect.midX, y: rect.minY))
            p.addLines([
                CGPoint(x: rect.maxX, y: rect.maxY),
                CGPoint(x: rect.minX, y: rect.maxY),
                CGPoint(x: rect.midX, y: rect.minY)
            ])
        }
    }
}

struct ContentView27: View {
    var body: some View {
        VStack {
            MeasureBehavior {
                Triangle()
            }
        }
    }
}

struct ContentView27_Previews: PreviewProvider {
    static var previews: some View {
        ContentView27()
    }
}
