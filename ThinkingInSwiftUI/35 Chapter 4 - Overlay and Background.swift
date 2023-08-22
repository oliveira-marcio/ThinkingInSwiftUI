//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView35: View {
    var body: some View {
        VStack {
            /*
             When we write content.overlay(other), the system creates an overlay modifier
             with two children: content and other.

             When the overlay modifier is laid out, the proposed size is passed to content.
             Then the reported size from content is passed to other as the proposed size.
             The overlay modifier reports back the size of content as its own size: in
             other words, the reported size of other is ignored.

             For content.background(other), the process is much the same, except that other
             is now drawn behind content.
             */
            Text("Hello").background(
                Capsule()
                    .stroke()
                    .padding(-5)
            )
            .border(.gray)
            Circle()
                .fill(Color.blue)
                .overlay(Circle().strokeBorder(Color.white).padding(3))
                .overlay(Text("Start").foregroundColor(.white))
                .frame(width: 75, height: 75)
                .border(.gray)
        }
    }
}

struct ContentView35_Previews: PreviewProvider {
    static var previews: some View {
        ContentView35()
    }
}
