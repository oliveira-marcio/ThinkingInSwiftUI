//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct Collapsible<Element, Content: View>: View {
    var data: [Element]
    var expanded: Bool = false
    var spacing: CGFloat? = 8
    var alignment: VerticalAlignment = .center
    var collapsedWidth: CGFloat = 10
    var content: (Element) -> Content
    func child(at index: Int) -> some View {
        let showExpanded = expanded || index == self.data.endIndex - 1
        return content(data[index])
            .frame(width: showExpanded ? nil : collapsedWidth,
                   alignment: Alignment(horizontal: .leading, vertical: alignment))
    }
    var body: some View {
        HStack(alignment: alignment, spacing: expanded ? spacing : 0) {
            ForEach(data.indices, id: \.self, content: { self.child(at: $0) })
        }
    }
}

struct RectangleData {
    let width: CGFloat
    let height: CGFloat
    let color: Color
}

struct ContentView45: View {
    let data = [
        RectangleData(width: 50, height: 50, color: .blue),
        RectangleData(width: 30, height: 30, color: .green),
        RectangleData(width: 70, height: 70, color: .red)
    ]
    var body: some View {
        VStack {
            Collapsible(data: data, expanded: false) { data in
                Rectangle().fill(data.color)
                    .frame(width: data.width, height: data.height)
            }.border(.gray)
            Collapsible(data: data, expanded: true) { data in
                Rectangle().fill(data.color)
                    .frame(width: data.width, height: data.height)
            }.border(.gray)
        }
    }
}

struct ContentView45_Previews: PreviewProvider {
    static var previews: some View {
        ContentView45()
    }
}
