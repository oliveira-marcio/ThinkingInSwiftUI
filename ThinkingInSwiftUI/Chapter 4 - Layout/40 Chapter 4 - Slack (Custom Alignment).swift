//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

enum MyCenterID: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        return context.height / 2
    }
}

extension VerticalAlignment {
    static let myCenter: VerticalAlignment = VerticalAlignment(MyCenterID.self)
}

struct StackView2: View {
    let alignment: VerticalAlignment

    var body: some View {
        HStack(alignment: alignment) {
            Rectangle().fill(Color.blue)
                .frame(width: 50, height: 50)
            Rectangle().fill(Color.green)
                .frame(width: 30, height: 30)
            Rectangle().fill(Color.red)
                .frame(width: 40, height: 40)
            // We could have used offset, but in this case the layout wouldn't be changed
            // so the view would be out of the bounds
                .alignmentGuide(alignment, computeValue: { dim in
                    return dim[alignment] - 20
                })
        }.border(Color.black)
    }
}

struct ContentView40: View {
    var body: some View {
        VStack {
            StackView1(alignment: .center)
            StackView1(alignment: .myCenter)
            StackView2(alignment: .myCenter)
        }
    }
}

struct ContentView40_Previews: PreviewProvider {
    static var previews: some View {
        ContentView40()
    }
}
