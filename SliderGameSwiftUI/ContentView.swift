//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Aleksandr F. on 24.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    @State private var alert = false
    
    var body: some View {
        VStack {
            GamesSliderView(
                currentValue: $currentValue,
                targetValue: targetValue,
                color: .red,
                alpha: computeScore()
            )
            
            Button("Проверь меня!") {
                alert = true
            }
            .padding()
            .alert("Your Score", isPresented: $alert, actions: {}) {
                Text("\(computeScore())")
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 1...100)
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
