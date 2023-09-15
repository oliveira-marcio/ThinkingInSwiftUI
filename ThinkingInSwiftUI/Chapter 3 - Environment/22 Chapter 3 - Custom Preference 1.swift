//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView22: View {
    var body: some View {
        MyNavigationView {
            Text("Hello!")
                .myNavigationTitle("Root View")
                .background(Color.gray)
        }
    }
}

struct MyNavigationView<Content>: View where Content: View {
    let content: () -> Content
    @State private var title: String? = nil
    var body: some View {
        VStack {
            Text(title ?? "")
                .font(Font.largeTitle)
                .padding()
            content()
            Spacer()
        }
        .onPreferenceChange(MyNavigationTitleKey.self) { self.title = $0 }
    }
}

struct MyNavigationTitleKey: PreferenceKey {
    static var defaultValue: String? = nil
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = value ?? nextValue()
    }
}

extension View {
    func myNavigationTitle(_ title: String) -> some View {
        preference(key: MyNavigationTitleKey.self, value: title)
    }
}

struct ContentView22_Previews: PreviewProvider {
    static var previews: some View {
        ContentView22()
    }
}
