//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct LabelView7: View {
    @Binding var number: Int
    var body: some View {
//        Regular if/else, outside ViewBuilders, now works!
//        if number > 0 {
//            Text("You've really tapped \(number) times")
//        } else {
//            Image(systemName: "lightbulb")
//        }
        Group {
            if number > 0 {
                Text("You've tapped \(number) times")
            } else {
                Image(systemName: "lightbulb")
            }
        }
    }
}

struct ContentView7: View {
    @State var counter = 0
    var body: some View {
        return VStack {
            Button(action: { self.counter += 1 }, label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            })
            LabelView7(number: $counter)
        }
        .frame(width: 200, height: 200)
        .border(Color.black)
    }
}

struct ContentView7_Previews: PreviewProvider {
    static var previews: some View {
        ContentView7()
    }
}

