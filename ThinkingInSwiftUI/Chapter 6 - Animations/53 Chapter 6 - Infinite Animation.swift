//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct LoadingIndicator: View {
    @State private var animating = false
    var body: some View {
        Image(systemName: "rays")
            .rotationEffect(animating ? Angle.degrees(360) : .zero)
            .animation(Animation
                .linear(duration: 2)
                .repeatForever(autoreverses: false),
                       value: animating
            )
            .onAppear { self.animating = true }
    }
}

struct ContentView53: View {
    var body: some View {
        LoadingIndicator()
    }
}

struct ContentView53_Previews: PreviewProvider {
    static var previews: some View {
        ContentView53()
    }
}
