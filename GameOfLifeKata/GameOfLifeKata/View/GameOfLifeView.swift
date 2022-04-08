//
//  GameOfLifeView.swift
//  GameOfLifeKata
//
//  Created by Yevhen Mokeiev on 11.03.2022.
//

import SwiftUI

struct GameOfLifeView: View {

  @State private var columns: Int?
  @State private var rows: Int?
  @State var isDisplayingGame = false
  @ObservedObject var viewModel: GameOfLifeViewModel

  init(
    viewModel: GameOfLifeViewModel
  ) {
    self.viewModel = viewModel
  }

  var body: some View {
    VStack {
      Text("Convay's Game of Life")
        .font(.system(size: 25))
        .padding()
      HStack {
        Text("Enter number of columns")
          .frame(maxHeight: .infinity)
          .padding()
          .background(Color.greenColor)
        TextField(
          "Enter number",
          value: $columns,
          format: .number
        )
          .frame(maxHeight: .infinity)
          .padding()
          .background(Color.yellowColor)
      }
      .fixedSize(horizontal: false, vertical: true)
      .padding()
      HStack {
        Text("Enter number of rows")
          .frame(maxHeight: .infinity)
          .padding()
          .background(Color.greenColor)
        TextField(
          "Enter number",
          value: $rows,
          format: .number
        )
          .frame(maxHeight: .infinity)
          .padding()
          .background(Color.yellowColor)
      }
      .fixedSize(horizontal: false, vertical: true)
      .padding()
      Button("Initialize Game of Life!") {
        if let rows = rows, let columns = columns {
          isDisplayingGame = true
          initializeMatrix(rows: rows, columns: columns)
        }
      }
      .padding()
      .background(Color.blueColor)
      if isDisplayingGame,
          let rows = self.rows,
          let columns = self.columns {
        drawGameOfLife(rows: rows, columns: columns)
      }
      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .foregroundColor(.white)
    .background(Color(uiColor: .lightGray))
  }

  @ViewBuilder func drawGameOfLife(
    rows: Int,
    columns: Int
  ) -> some View {
    VStack(spacing: 0) {
      ForEach(0..<rows, id: \.self) { row in
        HStack(spacing: 0) {
          ForEach(0..<columns, id: \.self) { column in
            let isAlive = viewModel.matrix?.isAlive(
              column: column,
              row: row
            ) ?? false
            Button {
              viewModel.matrix = viewModel.matrix?.setAlive(
                isAlive: !isAlive,
                column: column,
                row: row
              )
            } label: {
              Image(systemName: isAlive ? "square.fill" : "square")
                .resizable()
                .foregroundColor(.black)
                .frame(width: 40, height: 40)
            }
          }
        }
      }
    }
    .padding()
    Button("Show Next Generation") {
      viewModel.transitionToNextGeneration()
    }
    .padding()
    .background(Color.blueColor)
  }

  func initializeMatrix(rows: Int, columns: Int) {
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
