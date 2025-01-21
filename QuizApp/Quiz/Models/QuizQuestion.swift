//
//  QuizQuestion.swift
//  QuizApp
//
//  Created by Harsh Prajapat on 20/01/25.
//

import Foundation

struct QuizQuestion: Identifiable, Codable {
  let id = UUID()
  let question: String
  let options: [String]
  let correctAnswer: String
}
