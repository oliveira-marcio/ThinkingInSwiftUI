//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

// Both views are refreshed
struct LabelView3: View {
    let number: Int
    var body: some View {
        print("LabelView3")
        return number > 0
        ? Text("You've tapped \(number) times")
        : Text("You've not yet tapped")
    }
}

struct ContentView3: View {
    @State var counter = 0
    var body: some View {
        print("ContentView3")
        return VStack {
            Button(action: { self.counter += 1 }, label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            })
            LabelView3(number: counter)
        }
        .frame(width: 200, height: 200)
        .border(Color.black)
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
