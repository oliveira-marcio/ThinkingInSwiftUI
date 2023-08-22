//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct Knob7: View {
    var body: some View {
        KnobShape().frame(width: 32, height: 32)
    }
    func resizable() -> some View {
        /*
         The ideal dimensions are used when a proposed dimension is nil. For example, when
         the frame gets proposed a nil width but an ideal width is specified, the frame
         modifier proposes that ideal width to its child. Likewise, when the proposed width
         is nil, the frame modifier also returns the ideal width as its width, and it
         disregards the child’s width.
         */
        KnobShape()
            .aspectRatio(1, contentMode: .fit)
            .frame(idealWidth: 32, idealHeight: 32)
    }
}


struct ContentView32: View {
    var body: some View {
        VStack {
            MeasureBehavior {
                Knob7()
                    .resizable()
            }
        }
    }
}

struct ContentView32_Previews: PreviewProvider {
    static var previews: some View {
        ContentView32()
    }
}
