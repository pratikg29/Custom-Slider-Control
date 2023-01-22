//
//  ContentView.swift
//  AppleMusicSlider
//
//  Created by Pratik on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var playerDuration: TimeInterval = 100
    private let maxDuration = TimeInterval(240)
    
    @State private var volume: Double = 0.3
    private var maxVolume: Double = 1
    
    @State private var sliderValue: Double = 10
    private var maxSliderValue: Double = 100
    
    @State private var color: Color = .white
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.brown, .brown.opacity(0.1)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .overlay(.ultraThinMaterial)
            
            VStack(alignment: .leading, spacing: 60) {
                individualComponentsSection
                
                Spacer()
            }
            .padding([.horizontal, .top], 50)
        }
    }
    
    private var individualComponentsSection: some View {
        VStack(alignment: .trailing, spacing: 20) {
            VerticalVolumeSlider(value: $volume, inRange: 0...maxVolume, activeFillColor: color, fillColor: normalFillColor, emptyColor: emptyColor, width: 8) { started in
                
            }
            .frame(height: 130)
            
            CustomSlider(value: $sliderValue, inRange: 0...maxSliderValue, activeFillColor: color, fillColor: normalFillColor, emptyColor: emptyColor, height: 8) { started in
                
            }
            .frame(height: 40)
            
            MusicProgressSlider(value: $playerDuration, inRange: TimeInterval.zero...maxDuration, activeFillColor: color, fillColor: normalFillColor, emptyColor: emptyColor, height: 32) { started in
                
            }
            .frame(height: 40)
            
            VolumeSlider(value: $volume, inRange: 0...maxVolume, activeFillColor: color, fillColor: normalFillColor, emptyColor: emptyColor, height: 8) { started in
                
            }
            .frame(height: 30)
            
//            ColorPicker(selection: $color) {
//                Text("Select Color")
//            }
        }
    }
    
    private var normalFillColor: Color { color.opacity(0.5) }
    private var emptyColor: Color { color.opacity(0.3) }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
