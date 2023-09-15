//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView47: View {
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(Color.red)
                .frame(width: proxy.size.width/3)
        }
    }
}

struct ContentView47_Previews: PreviewProvider {
    static var previews: some View {
        ContentView47()
    }
}
