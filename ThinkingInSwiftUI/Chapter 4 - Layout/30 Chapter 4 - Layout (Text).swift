//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView30: View {
    var body: some View {
        ScrollView {
            VStack {
                let text = Text("Hello SwiftUI layouts")
                /*
                 It always tries to fit its contents in the proposed size, and it returns the
                 bounding box of the rendered text as its result. If the underlying string
                 does not contain newlines, it attempts to render the entire text on a single
                 line (given there is enough horizontal space). If there’s not enough horizontal
                 space available, Text looks at the available vertical space. If there’s enough
                 vertical space, it will break the text into multiple lines (line wrapping) and
                 try to fit the entire text inside the proposed size. If there’s not enough
                 vertical space either, the text will be truncated.
                 */
                MeasureBehavior { text }
                // It prevents line wrapping
                MeasureBehavior { text.fixedSize() }
                // It specifies the maximum number of lines
                MeasureBehavior { text.lineLimit(2) }
                // It allows Text to be rendered at a smaller font size (if the text doesn’t fit)
                MeasureBehavior { text.minimumScaleFactor(0.5) }
                // It determines the truncation behavior
                MeasureBehavior {
                    text
                        .lineLimit(1)
                        .truncationMode(.middle)
                }
            }
        }
    }

    struct ContentView30_Previews: PreviewProvider {
        static var previews: some View {
            ContentView30()
        }
    }
}
