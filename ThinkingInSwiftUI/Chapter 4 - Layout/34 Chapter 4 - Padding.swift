//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView34: View {
    var body: some View {
        HStack {
            // subtracts the padding from the proposed size and proposes this
            // new size to its child
            Circle().fill(Color.red)
                .padding()
                .frame(width: 60, height: 60)
                .border(.gray)
            Circle().fill(Color.blue)
                .padding(EdgeInsets(top: 5,
                                    leading: 3,
                                    bottom: 0,
                                    trailing: 7))
                .frame(width: 60, height: 60)
                .border(.gray)
            Circle().fill(Color.green)
                .padding(.leading)
                .frame(width: 60, height: 60)
                .border(.gray)
        }
    }
}

struct ContentView34_Previews: PreviewProvider {
    static var previews: some View {
        ContentView34()
    }
}
