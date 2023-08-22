//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView37: View {
    var body: some View {
        MeasureBehavior {
            /*
             HStack layout works in 2 passes (the same vor VStack):

             1) Takes the proposed horizontal space, subtracts the spacing, and divides up
             the remaining space into equal parts
             2) HStack knows which elements have a flexible width and which ones have a
             fixed width. It also knows the actual widths of the fixed elements. It takes
             all the fixed-size elements and deducts their widths from the proposed width.
             It also deducts any spacing, which leaves us with the flexible space. It then
             evenly distributes that flexible space to all the flexible children.

             In the example below, given that there is enough horizontal space, the HStack
             will first take the width of the Text (which is fixed) and the spacing in
             between elements and deduct that from the proposed size. Because the rectangle
             has a flexible maximum width, it will fill up the remainder of the proposed
             width.

             Consider that the Text view renders at 93 points wide. If the HStack’s layout
             method gets offered 250 points, during the first pass, it will first subtract
             the space (8 points) and then propose 121 points to each of the children
             (calculated as (250-8)/2). When Text gets proposed 121 points, it is fine with
             this: it only needs 93 points, and it reports that as its fixed size. The
             rectangle (or to be more precise, the .frame modifier) wants to be at least
             200 points wide, and it is larger than the proposed size. That means the Text
             will draw itself at 93 points, the Rectangle will be 200 points, and with 8
             points of space in between, the entire HStack will be 301 points wide. In
             other words, the HStack will be wider than the proposed size, and its content
             will be out of bounds.
             */
            HStack {
                Text("Hello, World")
                Rectangle().fill(Color.red).frame(minWidth: 200)
            }
        }
    }
}

struct ContentView37_Previews: PreviewProvider {
    static var previews: some View {
        ContentView37()
    }
}
