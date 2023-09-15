//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

struct ContentView29: View {
    var body: some View {
        ScrollView {
            VStack {
                let image = Image(systemName: "ellipsis")
                // by default, Image views have a fixed size (from the image itself)
                MeasureBehavior {
                    image
                }
                // resizable() make it accept the proposed size and fit the image within the
                // space. By default, it stretches the image to fill the proposed size.
                MeasureBehavior {
                    image
                        .resizable()
                }
                // aspectRatio() takes the proposed size and creates a new size that best fills
                // the proposed size, taking the given aspect ratio into account. It then
                // proposes this size to the resizable image (which fills up this size) and
                // returns it to the parent
                MeasureBehavior {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                // fill the proposed size
                MeasureBehavior {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
        }
    }

    struct ContentView29_Previews: PreviewProvider {
        static var previews: some View {
            ContentView29()
        }
    }
}
