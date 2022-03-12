//
//  GameOfLifeViewModel.swift
//  GameOfLifeKata
//
//  Created by Yevhen Mokeiev on 11.03.2022.
//

import SwiftUI

final class GameOfLifeViewModel: ObservableObject {

  @Published var matrix: Array2D?

  func setupMatrix(columns: Int, rows: Int) {
    matrix = Array2D(columns: columns, rows: rows)
  }

  func transitionToNextGeneration() {
    matrix = matrix?.nextGeneration
  }
}
