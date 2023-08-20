//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView23: View {
    var body: some View {
        MyTabView {
            Text("Hello!")
                .background(Color.gray)
                .myTabItems(["tab1", "tab2", "tab3"])
        }
    }
}

struct MyTabView<Content>: View where Content: View {
    let content: () -> Content
    @State private var items: [String] = []
    var body: some View {
        VStack {
            Spacer()
            content()
            Spacer()
            HStack {
                Spacer()
                ForEach(Array(items.enumerated()), id: \.offset) { item in
                    Text(item.element)
                        .font(.footnote)
                    Spacer()
                }
            }
        }
        .onPreferenceChange(MyTabItemKey.self) { self.items = $0 }
    }
}

struct MyTabItemKey: PreferenceKey {
    static let defaultValue: [String] = []
    static func reduce(value: inout [String], nextValue: () -> [String]) {
        value.append(contentsOf: nextValue())
    }
}

extension View {
    func myTabItems(_ items: [String]) -> some View {
        preference(key: MyTabItemKey.self, value: items)
    }
}

struct ContentView23_Previews: PreviewProvider {
    static var previews: some View {
        ContentView23()
    }
}
