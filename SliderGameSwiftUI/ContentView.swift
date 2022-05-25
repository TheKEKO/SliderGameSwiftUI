//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Aleksandr F. on 24.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue: Float = 50.0
    @State private var alpha: CGFloat = 0
    @State private var alert = false
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
                .padding()
            
            HStack{
                Text("1")
                SliderValue(sliderValue: $currentValue, alpha: $alpha)
                Text("100")
            }
            .onChange(of: currentValue) {
                value in currentValue = Float(Int(value))
                alphaValue()
            }
            .onAppear { alphaValue() }
            .padding()
            
            Button("Проверь меня!") {
                alert.toggle()
            }
            .alert(isPresented: $alert) {
                Alert(
                    title: Text ("Your Score"),
                    message: Text("\(computeScore())"),
                    dismissButton: .cancel()
                )
            }
            .padding()
            Button("Начать заново") {
                targetValue = Int.random(in: 1...100)
                alphaValue()
            }
        }
    }
    
    private func alphaValue() {
        alpha = CGFloat(computeScore())
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
