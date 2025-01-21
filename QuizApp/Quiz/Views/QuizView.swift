//
//  QuizView.swift
//  QuizApp
//
//  Created by Harsh Prajapat on 20/01/25.
//

import SwiftUI

struct QuizView: View {
  @StateObject var viewModel = QuizViewModel()
  
  var body: some View {
    ZStack {
      // Background
      LinearGradientBackground()
      
      ScrollView {
        VStack(spacing: 20) {
          // Header
          headerView()
          
          // Question Number
          questionNumberView()
          
          // Timer Circle
          TimeView(timeValue: $viewModel.timer)
          
          // Question
          QuestionView()
          
          // Options
          optionsView()
          
          // Submit Button
          submitActionView()
        }
        .padding()
      }
      
      if viewModel.showResult {
        OverlayView(showOverlay: $viewModel.showResult)
          .transition(.opacity)
      }
    }
  }
}

struct QuizView_Previews: PreviewProvider {
  static var previews: some View {
    QuizView()
  }
}
