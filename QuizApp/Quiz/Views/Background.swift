//
//  LinearGradientBackground.swift
//  QuizApp
//
//  Created by Harsh Prajapat on 20/01/25.
//

import SwiftUI

struct PurpleBackground: View {
  var body: some View {
    Color.purple.ignoresSafeArea()
  }
}

struct LinearGradientBackground: View {
  var body: some View {
    LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                   startPoint: .top, endPoint: .bottom)
    .ignoresSafeArea()
  }
}
