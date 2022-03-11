//
//  GameOfLifeView.swift
//  GameOfLifeKata
//
//  Created by Yevhen Mokeiev on 11.03.2022.
//

import SwiftUI

struct GameOfLifeView: View {

  @State private var columns = 0
  @State private var rows = 0
  @State var isDisplayingGame = false
  @ObservedObject var viewModel: GameOfLifeViewModel

  init(
    viewModel: GameOfLifeViewModel
  ) {
    self.viewModel = viewModel
  }

  var body: some View {
    HStack {
      Text("Enter number of columns:")
      TextField(
        "Enter number",
        value: $columns,
        format: .number
      )
    }.padding()
    HStack {
      Text("Enter number of rows:")
      TextField(
        "Enter number",
        value: $rows,
        format: .number
      )
    }.padding()
    Button("Initialize Game of Life!") {
      isDisplayingGame = true
      initializeMatrix()
    }.padding()
    if isDisplayingGame {
      drawGameOfLife()
    }
  }

  @ViewBuilder func drawGameOfLife() -> some View {
    VStack {
      ForEach(0..<rows) { row in
        HStack {
          ForEach(0..<columns) { column in
            let isAlive = viewModel.matrix?.isAlive(
              column: column,
              row: row
            ) ?? false
            Button(isAlive ? "*" : "-") {
              viewModel.matrix = viewModel.matrix?.setAlive(
                isAlive: !isAlive,
                column: column,
                row: row
              )
            }.font(.system(size: 40))
          }
        }
      }
    }.padding()
    Button("Show Next Generation") {
      viewModel.transitionToNextGeneration()
    }
  }

  func initializeMatrix() {
    viewModel.setupMatrix(
      columns: columns,
      rows: rows
    )
  }
}

struct GameOfLifeView_Previews: PreviewProvider {
  static var previews: some View {
    GameOfLifeView(viewModel: GameOfLifeViewModel())
  }
}
