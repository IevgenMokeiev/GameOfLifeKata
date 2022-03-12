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
    guard let currentMatrix = matrix else {
      return
    }
    var nextGenMatrix = currentMatrix
    // 1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    // 2. Any live cell with more than three live neighbours dies, as if by overcrowding.
    // 3. Any dead cell with exactly three live neighbours becomes a live cell.
    for row in 0..<currentMatrix.rows {
      for column in 0..<currentMatrix.columns {
        if currentMatrix.isAlive(column: column, row: row) {
          if currentMatrix.numberOfLiveNeighbours(column: column, row: row) < 2 ||
              currentMatrix.numberOfLiveNeighbours(column: column, row: row) > 3 {
            nextGenMatrix = nextGenMatrix.setAlive(isAlive: false, column: column, row: row)
          }
        } else if currentMatrix.numberOfLiveNeighbours(column: column, row: row) == 3 {
          nextGenMatrix = nextGenMatrix.setAlive(isAlive: true, column: column, row: row)
        }
      }
    }
    matrix = nextGenMatrix
  }
}
