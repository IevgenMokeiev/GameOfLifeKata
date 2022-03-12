//
//  GameOfLifeKataTests.swift
//  GameOfLifeKataTests
//
//  Created by Yevhen Mokeiev on 11.03.2022.
//

import XCTest
@testable import GameOfLifeKata

class Array2DTests: XCTestCase {

  func test_isAlive() {
    var matrix = Array2D(columns: 4, rows: 4)
    matrix[1, 1] = 0
    matrix[2, 2] = 1

    XCTAssertFalse(matrix.isAlive(column: 1, row: 1))
    XCTAssertTrue(matrix.isAlive(column: 2, row: 2))
  }

  func test_setAlive() {
    var matrix = Array2D(columns: 4, rows: 4)
    matrix = matrix.setAlive(isAlive: true, column: 2, row: 2)
    XCTAssertTrue(matrix.isAlive(column: 2, row: 2))
    matrix = matrix.setAlive(isAlive: false, column: 2, row: 2)
    XCTAssertFalse(matrix.isAlive(column: 2, row: 2))
  }

  func test_numberOfLiveNeighbours() {
    var matrix = Array2D(columns: 4, rows: 4)
    matrix = matrix.setAlive(isAlive: true, column: 2, row: 2)
    matrix = matrix.setAlive(isAlive: true, column: 2, row: 1)
    matrix = matrix.setAlive(isAlive: true, column: 1, row: 1)
    matrix = matrix.setAlive(isAlive: true, column: 0, row: 0)

    XCTAssertEqual(matrix.numberOfLiveNeighbours(column: 2, row: 2), 2)
    XCTAssertEqual(matrix.numberOfLiveNeighbours(column: 0, row: 0), 1)
    XCTAssertEqual(matrix.numberOfLiveNeighbours(column: 1, row: 1), 3)
    XCTAssertEqual(matrix.numberOfLiveNeighbours(column: 1, row: 0), 3)
  }

  func test_nextGeneration() {
    var matrix = Array2D(columns: 4, rows: 4)
    matrix = matrix.setAlive(isAlive: true, column: 2, row: 2)
    matrix = matrix.setAlive(isAlive: true, column: 2, row: 1)
    matrix = matrix.setAlive(isAlive: true, column: 1, row: 1)
    matrix = matrix.setAlive(isAlive: true, column: 0, row: 0)

    var nextGeneration = Array2D(columns: 4, rows: 4)
    nextGeneration[1, 0] = 1
    nextGeneration[1, 1] = 1
    nextGeneration[2, 1] = 1
    nextGeneration[1, 2] = 1
    nextGeneration[2, 2] = 1

    XCTAssertEqual(matrix.nextGeneration, nextGeneration)
  }
}
