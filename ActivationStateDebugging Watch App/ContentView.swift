//
//  ContentView.swift
//  ActivationStateDebugging Watch App
//
//  Created by Cesare Forelli on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    
    @State var log = "01. app launch\n"
    @State var counter = 1
    
    var body: some View {
        
        ScrollView {
            Text(log)
                .font(.footnote)
                .monospaced()
        }
        .onChange(of: scenePhase, initial: true, { oldState, newState in
            counter += 1
            log = "\(String(format: "%02d", counter)). \(newState)\n\(log)"
        })
    }
}

#Preview {
    ContentView()
}
