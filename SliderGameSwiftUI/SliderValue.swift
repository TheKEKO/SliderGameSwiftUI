//
//  SliderValue.swift
//  SliderGameSwiftUI
//
//  Created by Aleksandr F. on 25.05.2022.
//

import SwiftUI

struct SliderValue: UIViewRepresentable {
    
    @Binding var sliderValue: Float
    @Binding var alpha: CGFloat

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didChangeValueSlider),
            for: .valueChanged
        )
        
        return slider
        
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: alpha / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $sliderValue)
    }
}

extension SliderValue {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func didChangeValueSlider(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct SliderValue_Previews: PreviewProvider {
    static var previews: some View {
        SliderValue(sliderValue: .constant(50), alpha: .constant(100))
    }
}
