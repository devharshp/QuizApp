//
//  CongratsAnimationView.swift
//  QuizApp
//
//  Created by Harsh Prajapat on 20/01/25.
//

import SwiftUI

struct CongratsAnimationView: View {
  @State private var showText = false
  
  var body: some View {
    VStack {
      Button("Tap Me") {
        withAnimation(.easeInOut(duration: 1)) {
          showText.toggle()
        }
      }
      .padding()
      .background(Color.blue)
      .foregroundColor(.white)
      .clipShape(Capsule())
      
      if showText {
        Text("🎉 Congratulations! 🎉")
          .font(.largeTitle)
          .fontWeight(.bold)
          .transition(.scale.combined(with: .opacity))
      }
    }
  }
}

struct CongratsAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    CongratsAnimationView()
  }
}

