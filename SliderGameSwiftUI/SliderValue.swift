//
//  SliderValue.swift
//  SliderGameSwiftUI
//
//  Created by Aleksandr F. on 25.05.2022.
//

import SwiftUI

struct SliderValue: UIViewRepresentable {
    
    @Binding var value: Double
    
    let alpha: Int
    let color: UIColor

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
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderValue {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func didChangeValueSlider(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderValue_Previews: PreviewProvider {
    static var previews: some View {
        SliderValue(value: .constant(50), alpha: 100, color: .red)
    }
}
