//
//  RunkeeperApp.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-15.
//

import SwiftUI

@main
struct RunkeeperApp: App {
	init() {
		let coloredNavAppearance = UINavigationBarAppearance()
		coloredNavAppearance.configureWithOpaqueBackground()
		coloredNavAppearance.backgroundColor = .rkLightGreenishBlue
		coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]

		UINavigationBar.appearance().standardAppearance = coloredNavAppearance
		UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
	}
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
