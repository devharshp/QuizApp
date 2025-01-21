//
//  OverlayView.swift
//  QuizApp
//
//  Created by Harsh Prajapat on 21/01/25.
//

import SwiftUI

struct OverlayView: View {
  @Binding var showOverlay: Bool
  @State private var animateRain = false
  
  var body: some View {
    ZStack {
      Color.black.opacity(0.6) // Transparent Dark Background
      
      VStack(spacing: 20) {
        Text("🎉 Congratulations! 🎉")
          .font(.largeTitle)
          .bold()
          .foregroundColor(.white)
        
        Text("You have successfully completed the quiz!")
          .font(.title2)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
        
        Button("Dismiss") {
          withAnimation {
            showOverlay = false
          }
        }
        .padding()
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(10)
      }
      .padding()
      
      RainEffect()
        .opacity(animateRain ? 1 : 0)
        .onAppear {
          withAnimation(.easeIn(duration: 1.0)) {
            animateRain = true
          }
          DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
              showOverlay = true
            }
          }
        }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct RainEffect: View {
  let raindrops = Array(1...50)
  
  var body: some View {
    ZStack {
      ForEach(raindrops, id: \.self) { _ in
        Circle()
          .fill(Color.white.opacity(0.8))
          .frame(width: 5, height: 5)
          .position(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                    y: CGFloat.random(in: -100...UIScreen.main.bounds.height))
          .animation(Animation.linear(duration: 1.5).repeatForever().delay(Double.random(in: 0...1)), value: UUID())
      }
    }
  }
}
