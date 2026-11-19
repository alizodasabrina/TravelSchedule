//
//  ContentView.swift
//  TravelSchedule
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .task {
                await NetworkTestCalls.runAll()
            }
    }
}

#Preview {
    ContentView()
}
