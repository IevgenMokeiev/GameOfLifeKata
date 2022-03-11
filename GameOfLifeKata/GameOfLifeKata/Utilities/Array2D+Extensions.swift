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
}
