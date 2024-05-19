//
//  MeditationApp.swift
//  Meditation
//
//  Created by Tony Buffard on 2024-05-19.
//

import SwiftUI
import AppKit

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var hexNumber: UInt64 = 0
        
        // Remove the "#" prefix if present
        if hex.hasPrefix("#") {
            _ = scanner.scanString("#")
        }
        
        scanner.scanHexInt64(&hexNumber)
        
        let r = (hexNumber & 0xff0000) >> 16
        let g = (hexNumber & 0x00ff00) >> 8
        let b = hexNumber & 0x0000ff
        
        self.init(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255
        )
    }
}

@main
struct MeditationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .accentColor(Color(hex: "#69A197"))
                .frame(width: 230, height: 250)
        }.defaultSize(width: 230, height: 250)
    }
}
