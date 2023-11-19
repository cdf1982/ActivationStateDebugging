//
//  ContentView.swift
//  ActivationStateDebugging Watch App
//
//  Created by Cesare Forelli on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        
        VStack {
            switch scenePhase {
            case .background:
                Text("Background")
                    .font(.title2)
                    .foregroundColor(.red)
            case .inactive:
                Text("Inactive")
                    .font(.title2)
                    .foregroundColor(.yellow)
            case .active:
                Text("Active")
                    .font(.title2)
                    .foregroundColor(.green)
            @unknown default:
                Text("?")
            }
        }
        .onChange(of: scenePhase, initial: true, { oldState, newState in
            print("scenePhase went from \(oldState) to \(newState)")
        })
    }
    
}

#Preview {
    ContentView()
}
