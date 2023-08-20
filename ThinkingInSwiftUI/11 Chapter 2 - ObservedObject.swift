//
//  ContentView.swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 18/08/2023.
//

import SwiftUI

final class CurrentTime: ObservableObject {
    @Published var now: Date = Date()
    let interval: TimeInterval = 1
    private var timer: Timer? = nil

    func start() {
        guard timer == nil else { return }
        now = Date()
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) {
            [weak self] _ in
            self?.now = Date()
            print(self?.now)
        }
    }

    func stop() {
        timer?.invalidate()
        timer = nil
    }
}

// Start/Stop timer only when view appears/disapperas instead of the CurrentTime init()
// because it will be initialized with TimerView even it is still hidden because of the
// SwiftUI layout system that creates the whole view tree
struct TimerView: View {
    @ObservedObject var date = CurrentTime()
    var body: some View {
        Text("\(date.now)")
            .onAppear { self.date.start() }
            .onDisappear { self.date.stop() }
    }
}

struct ContentView11: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: TimerView(), label: {
                Text("Go to timer")
            })
        }
    }
}

struct ContentView11_Previews: PreviewProvider {
    static var previews: some View {
        ContentView11()
    }
}
