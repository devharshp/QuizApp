//
//  TimeView.swift
//  QuizApp
//
//  Created by Harsh Prajapat on 20/01/25.
//

import SwiftUI

struct TimeView: View {
  @Binding var timeValue: Int
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(lineWidth: 10)
        .foregroundColor(.gray.opacity(0.3))
      Circle()
        .trim(from: 0, to: CGFloat(timeValue) / 15.0)
        .stroke(Color.orange, lineWidth: 10)
        .rotationEffect(.degrees(-90))
      Text("\(timeValue)")
        .foregroundColor(.orange)
        .font(.title)
        .bold()
    }
    .frame(width: 80, height: 80)
    .padding(.vertical)
  }
}

