//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView38: View {
    var body: some View {
        MeasureBehavior {
            /*
             When there is limited space available, the HStack will first offer the
             available space to Text("chapter1.md"). Any remaining space is then offered to
             Text(longPath), which automatically gets truncated in the middle when it
             doesn’t fit inside the remaining space.
             */
            HStack(spacing: 0) {
                let longPath = "/Users/MSO/Desktop/Personal/Book/"
                Text(longPath).truncationMode(.middle).lineLimit(1)
                Text("chapter1.md").layoutPriority(1)
            }
        }
    }
}

struct ContentView38_Previews: PreviewProvider {
    static var previews: some View {
        ContentView38()
    }
}
