//
//  GamesSliderView.swift
//  SliderGameSwiftUI
//
//  Created by Aleksandr F. on 26.05.2022.
//

import SwiftUI

struct GamesSliderView: View {
    
    @Binding var currentValue: Double
    
    let targetValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                SliderValue(value: $currentValue, alpha: alpha, color: color)
                Text("100")
            }
            .padding()
        }
    }
}

struct GamesSliderView_Previews: PreviewProvider {
    static var previews: some View {
        GamesSliderView(
            currentValue: .constant(50),
            targetValue: 100,
            color: .red,
            alpha: 100
        )
    }
}
