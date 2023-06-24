//
//  denemebirikiApp.swift
//  denemebiriki
//
//  Created by SUNGU on 24.06.2023.
//

import SwiftUI

@main
struct denemebirikiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
