//
//  Array2D+Extensions.swift
//  GameOfLifeKata
//
//  Created by Yevhen Mokeiev on 11.03.2022.
//

extension Array2D {

  func setAlive(isAlive: Bool, column: Int, row: Int) -> Array2D {
    var matrix = self
    matrix[column, row] = isAlive ? 1 : 0
    return matrix
  }

  func isAlive(column: Int, row: Int) -> Bool {
    if self[column, row] == 1 {
      return true
    } else {
      return false
    }
  }

  func numberOfLiveNeighbours(column: Int, row: Int) -> Int {
    var number = 0

    if column - 1 >= 0 {
      if isAlive(column: column - 1, row: row) {
        number += 1
      }
    }

    if column + 1 < columns {
      if isAlive(column: column + 1, row: row) {
        number += 1
      }
    }

    if row - 1 >= 0 {
      if isAlive(column: column, row: row - 1) {
        number += 1
      }
    }

    if row + 1 < rows {
      if isAlive(column: column, row: row + 1) {
        number += 1
      }
    }

    if column - 1 >= 0, row - 1 >= 0 {
      if isAlive(column: column - 1, row: row - 1) {
        number += 1
      }
    }

    if column - 1 >= 0, row + 1 < rows {
      if isAlive(column: column - 1, row: row + 1) {
        number += 1
      }
    }

    if column + 1 < columns, row - 1 >= 0 {
      if isAlive(column: column + 1, row: row - 1) {
        number += 1
      }
    }

    if column + 1 < columns, row + 1 < rows {
      if isAlive(column: column + 1, row: row + 1) {
        number += 1
      }
    }

    return number
  }

  var nextGeneration: Array2D {
    var nextGenMatrix = self
    // 1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    // 2. Any live cell with more than three live neighbours dies, as if by overcrowding.
    // 3. Any dead cell with exactly three live neighbours becomes a live cell.
    for row in 0..<rows {
      for column in 0..<columns {
        if isAlive(column: column, row: row) {
          if numberOfLiveNeighbours(column: column, row: row) < 2 ||
              numberOfLiveNeighbours(column: column, row: row) > 3 {
            nextGenMatrix = nextGenMatrix.setAlive(isAlive: false, column: column, row: row)
          }
        } else if numberOfLiveNeighbours(column: column, row: row) == 3 {
          nextGenMatrix = nextGenMatrix.setAlive(isAlive: true, column: column, row: row)
        }
      }
    }

    return nextGenMatrix
  }
}
