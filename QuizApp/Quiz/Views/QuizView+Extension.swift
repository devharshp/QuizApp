//
//  QuizView+Extension.swift
//  QuizApp
//
//  Created by Harsh Prajapat on 20/01/25.
//

import SwiftUI

// MARK: - headerView

extension QuizView {
  @ViewBuilder
  func headerView() -> some View {
    HStack {
      Text(Constants.dailyQuiz)
        .foregroundColor(.yellow)
        .font(.title2)
        .bold()
      Spacer()
      Text("\(Constants.score) \(viewModel.score)")
        .foregroundColor(.white)
        .font(.headline)
    }
    .padding()
  }
}

// MARK: - questionNumberView

extension QuizView {
  @ViewBuilder
  func questionNumberView() -> some View {
    HStack {
      Text("\(Constants.question) \(viewModel.currentQuestionIndex + 1)/\(viewModel.questions.count)")
        .foregroundColor(.white)
        .font(.headline)
      Spacer()
    }
    .padding(.horizontal)
  }
}

// MARK: - QuestionView

extension QuizView {
  @ViewBuilder
  func QuestionView() -> some View {
    Text(viewModel.currentQuestion.question)
      .foregroundColor(.white)
      .font(.title3)
      .multilineTextAlignment(.center)
      .padding(.horizontal)
  }
}

// MARK: - optionsView

extension QuizView {
  @ViewBuilder
  func optionsView() -> some View {
    ForEach(viewModel.currentQuestion.options, id: \.self) { option in
      Button(action: {
        viewModel.selectOption(option)
      }) {
        Text(option)
          .padding()
          .frame(maxWidth: .infinity)
          .background(viewModel.selectedOption == option ? Color.orange : Color.white)
          .foregroundColor(viewModel.selectedOption == option ? .white : .black)
          .cornerRadius(8)
          .shadow(radius: 2)
      }
      .padding(.horizontal)
    }
  }
}

// MARK: - QuizView

extension QuizView {
  @ViewBuilder
  func submitActionView() -> some View {
    Button(action: {
      viewModel.submitAnswer()
    }) {
      Text(viewModel.questions.count - 1 == viewModel.currentQuestionIndex ? Constants.submit : Constants.next)
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
    .padding(.horizontal)
  }
}
