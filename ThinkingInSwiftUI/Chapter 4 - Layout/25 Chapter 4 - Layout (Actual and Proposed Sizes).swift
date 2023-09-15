//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct MeasureBehavior<Content: View>: View {
    @State private var width: CGFloat = 100
    @State private var height: CGFloat = 100
    var content: () -> Content
    var body: some View {
        VStack {
            content()
                .border(Color.gray)
                .frame(width: width, height: height)
                .border(Color.black)
            HStack {
                Text("W:")
                Slider(value: $width, in: 0...500)
            }
            HStack {
                Text("H:")
                Slider(value: $height, in: 0...200)
            }
        }.padding()
    }
}


struct ContentView25: View {
    var body: some View {
        VStack {
            MeasureBehavior {
                // takes the size needed to render its text until proposed size
                Text("Hello!")
            }
            MeasureBehavior {
                // takes the size needed to its children until proposed size
                VStack {
                    Text("Hello!")
                        .border(Color.red)
                        .padding()
                }
            }
            MeasureBehavior {
                // always fits itself into the proposed size
                Circle()
            }
        }
    }
}

struct ContentView25_Previews: PreviewProvider {
    static var previews: some View {
        ContentView25()
    }
}
