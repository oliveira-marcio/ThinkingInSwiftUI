//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct WidthKey: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    static func reduce(value: inout CGFloat?,
                       nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}

/*
When rendering the TextWithCircle view, the layout engine first proposes a size to the .frame modifier. Because
the initial value of the TextWithCircle’s width property is nil, the frame passes the proposed size down the view
hierarchy, all the way to the Text view. After Text has laid itself out, the geometry reader in the text’s
background is laid out using the exact same size as the text. Inside, we use .preference to communicate the
text’s size up the view tree. Then .onPreferenceChange happens, the view’s state changes, and the view
construction and layout process are triggered again. This time, self.width contains the text’s width, and the
view is laid out correctly. All of this happens during a single rendering pass (i.e. in between screen
refreshes).”
*/
struct TextWithCircle: View {
    @State private var width: CGFloat? = nil

    var body: some View {
        Text("Hello, world")
            .padding(10)
            .background(GeometryReader { proxy in
                Color.clear.preference(key: WidthKey.self,
                                       value: proxy.size.width)
            })
            .onPreferenceChange(WidthKey.self) { self.width = $0 }
            .frame(width: width, height: width)
            .background(Circle().fill(Color.blue))
    }
}

struct ContentView48: View {
    var body: some View {
        TextWithCircle()
    }
}

struct ContentView48_Previews: PreviewProvider {
    static var previews: some View {
        ContentView48()
    }
}
