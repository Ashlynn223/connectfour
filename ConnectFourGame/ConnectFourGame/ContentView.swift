//
//  ContentView.swift
//  ConnectFourGame
//
//  Created by Ashlynn Mitchell on 3/21/22.
//

import SwiftUI


class GridCells: ObservableObject {
    @Published var cells = [Cell]()
    func fillInCell(filled: Bool) {
        objectWillChange.send()
//        cells.insert(contentsOf: filled, at: cells[currentIndex].filled)
    }
}

class Cell: ObservableObject, Identifiable {
    var id = UUID()
    @Published var filled: Bool
    
    init(filled: Bool) {
        self.filled = filled
    }
}

struct ContentView: View {
    let gridCells: [Cell]
    @State private var currentDropPosition: Int = 0
    @State private var dropColumn: Int = 0
    func determineDropPosition() {
        currentDropPosition = dropColumn - 1
//        Cell(filled: true)
        
    }
    
    //each item in this array should have knowledge of if it was selected and who the selector was: gridItem: {selected: 3, selctor: "playerTwo"}
    //
    var body: some View {
        VStack {
            Text(" Connect Four! 🎋 ")
                .padding()
                ZStack {
                    Rectangle()
                        .fill(Color(
                            UIColor(red: 0.81, green: 2.06, blue: 0.84, alpha: 1.02)
                        ))
                    VStack {
                        HStack {
                            Button("Drop") { dropColumn = 1 }
                            .frame(width: 50)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            
                            Button("Drop") { dropColumn = 2 }
                            .frame(width: 50)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            
                            Button("Drop") { dropColumn = 3 }
                            .frame(width: 50)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            
                            Button("Drop") { dropColumn = 4 }
                            .frame(width: 50)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            
                            Button("Drop") { dropColumn = 5 }
                            .frame(width: 50)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                        }
                        LazyVGrid(
                            columns: [
                                GridItem(.fixed(50)),
                                GridItem(.fixed(50)),
                                GridItem(.fixed(50)),
                                GridItem(.fixed(50)),
                                GridItem(.fixed(50)),
                            ],
                            alignment: .leading,
                            spacing: 15
                        ) {
                            ForEach(gridCells.indices, id: \.self) { i in
                                ZStack {
                                    Rectangle()
                                        .fill((i+1 == dropColumn) ? .white : .green)
                                    .frame(height: 50)
                                    Text("\(i)")
                                }
                            }
                        }.padding()
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gridCells: [Cell]())
    }
}
