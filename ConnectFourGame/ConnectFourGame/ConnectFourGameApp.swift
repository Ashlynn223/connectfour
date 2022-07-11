//
//  ConnectFourGameApp.swift
//  ConnectFourGame
//
//  Created by Ashlynn Mitchell on 3/21/22.
//

import SwiftUI

@main
struct ConnectFourGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(gridCells: [Cell]())
        }
    }
}
