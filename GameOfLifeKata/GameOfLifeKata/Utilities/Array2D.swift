//
//  Array2D.swift
//  GameOfLifeKata
//
//  Created by Yevhen Mokeiev on 11.03.2022.
//

struct Array2D {
  let columns: Int
  let rows: Int
  private var matrix: [Int]

  init(columns: Int, rows: Int) {
    self.columns = columns
    self.rows = rows
    matrix = Array(repeating: 0, count: columns * rows)
  }

  subscript(column: Int, row: Int) -> Int {
    get {
      return matrix[columns * row + column]
    }
    set {
      matrix[columns * row + column] = newValue
    }
  }
}
