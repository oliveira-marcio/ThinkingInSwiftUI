//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

// Only LabelView is refreshed
struct LabelView8: View {
    var number: Binding<Int>
    var body: some View {
        print("LabelView8")
        return Group {
            if number.wrappedValue > 0 {
                Text("You've tapped \(number.wrappedValue) times")
            } else {
                Text("You've not yet tapped")
            }
        }
    }
}

struct ContentView8: View {
    var counter = State(initialValue: 0)
    var body: some View {
        print("ContentView8")
        return VStack {
            Button(action: { self.counter.wrappedValue += 1 }, label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            })
            LabelView8(number: counter.projectedValue)
        }
        .frame(width: 200, height: 200)
        .border(Color.black)
    }
}

struct ContentView8_Previews: PreviewProvider {
    static var previews: some View {
        ContentView8()
    }
}
