//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

// Only LabelView is refreshed
struct LabelView4: View {
    @State var counter = 0
    var body: some View {
        print("LabelView4")
        return VStack {
            Button(action: { self.counter += 1 }, label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            })
            if counter > 0 {
                Text("You've tapped \(counter) times")
            } else {
                Text("You've not yet tapped")
            }
        }
        .frame(width: 200, height: 200)
        .border(Color.black)
    }
}

struct ContentView4: View {
    var body: some View {
        print("ContentView4")
        return LabelView4()
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
