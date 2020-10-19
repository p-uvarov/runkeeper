//
//  HomeView.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-19.
//

import SwiftUI

struct HomeView: View {
	@EnvironmentObject var settings: UserSettings
	
	init() {
		let coloredNavAppearance = UINavigationBarAppearance()
		coloredNavAppearance.configureWithOpaqueBackground()
		coloredNavAppearance.backgroundColor = .rkLightGreenishBlue
		coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]

		UINavigationBar.appearance().standardAppearance = coloredNavAppearance
		UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
	}
	
	var body: some View {
		NavigationView {
			NavigationLink(destination: AchievementsView(), isActive: $settings.isActive) {
				ZStack {
					Capsule()
						.fill(Color(.rkLightGreenishBlue))
						.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
						.padding(.horizontal, 15)
					Text("Achievements")
						.font(.system(size: 22, weight: .bold, design: .default))
						.foregroundColor(.white)
				}
			}
			.navigationBarTitle(settings.isActive ? "" : "Main" , displayMode: .inline)
		}
		.accentColor(.white)
	}
}
