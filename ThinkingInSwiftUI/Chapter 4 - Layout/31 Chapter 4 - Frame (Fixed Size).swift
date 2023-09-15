//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView31: View {
    var body: some View {
        VStack {
            MeasureBehavior {
                // Frame’s layout method will propose this fixed width to its child view
                Text("Hello World SwiftUI")
                    .frame(width: 100)
            }
        }
    }
}

struct ContentView31_Previews: PreviewProvider {
    static var previews: some View {
        ContentView31()
    }
}
