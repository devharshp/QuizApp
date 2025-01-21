//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Harsh Prajapat on 20/01/25.
//

import SwiftUI

class QuizViewModel: ObservableObject {
  @Published var questions: [QuizQuestion] = []
  @Published var currentQuestionIndex = 0
  @Published var selectedOption: String? = nil
  @Published var timer = 15
  @Published var score = 0
  @Published var showResult = false
  
  var currentQuestion: QuizQuestion {
    questions[currentQuestionIndex]
  }
  
  private var timerSubscription: Timer?
  
  init() {
    loadQuestions()
    startTimer()
  }
  
  func loadQuestions() {
    if let url = Bundle.main.url(forResource: "quiz", withExtension: "json") {
      do {
        let data = try Data(contentsOf: url)
        let decodedData = try JSONDecoder().decode([QuizQuestion].self, from: data)
        self.questions = decodedData
//        DispatchQueue.main.async {}
      } catch {
        print("Error loading quiz data: \(error)")
      }
    }
  }
  
  func loadQuestions1() {
    questions = [
      QuizQuestion(
        question: "What device allows you to see the output of a computer?",
        options: ["Central Processing Unit (CPU)", "Graphics Processing Unit (GPU)", "Monitor", "Keyboard"],
        correctAnswer: "Monitor"
      ),
      QuizQuestion(
        question: "Which language is used for iOS development?",
        options: ["Swift", "Python", "Java", "Ruby"],
        correctAnswer: "Swift"
      )
    ]
  }
  
  func startTimer() {
    timerSubscription?.invalidate()
    timer = 15
    timerSubscription = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
      guard let self = self else { return }
      if self.timer > 0 {
        self.timer -= 1
      } else {
        self.moveToNextQuestion()
      }
    }
  }
  
  func selectOption(_ option: String) {
    selectedOption = option
  }
  
  func submitAnswer() {
    if selectedOption == currentQuestion.correctAnswer {
      score += 10
    }
    moveToNextQuestion()
  }
  
  func moveToNextQuestion() {
    if currentQuestionIndex < questions.count - 1 {
      currentQuestionIndex += 1
      selectedOption = nil
      startTimer()
    } else {
      timerSubscription?.invalidate()
      // Handle quiz completion (e.g., show results)
      showResult = true
    }
  }
}
