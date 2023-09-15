//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

// Only LabelView is refreshed
struct LabelView5: View {
    @Binding var number: Int
    var body: some View {
        print("LabelView5")
        return Group {
            if number > 0 {
                Text("You've tapped \(number) times")
            } else {
                Text("You've not yet tapped")
            }
        }
    }
}

struct ContentView5: View {
    @State var counter = 0
    var body: some View {
        print("ContentView5")
        return VStack {
            Button(action: { self.counter += 1 }, label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            })
            LabelView5(number: $counter)
        }
        .frame(width: 200, height: 200)
        .border(Color.black)
    }
}

struct ContentView5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}
