//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView26: View {
    var body: some View {
        VStack {
            MeasureBehavior {
                // list of 2D drawing instructions (similar to a CGPath in Cocoa).
                // When the layout method on Path is called, it always returns the
                // proposed size as its actual size
                Path { p in
                    p.move(to: CGPoint(x: 50, y: 0))
                    p.addLines([
                        CGPoint(x: 100, y: 75),
                        CGPoint(x: 0, y: 75),
                        CGPoint(x: 50, y: 0)
                    ])
                }
            }
        }
    }
}

struct ContentView26_Previews: PreviewProvider {
    static var previews: some View {
        ContentView26()
    }
}
