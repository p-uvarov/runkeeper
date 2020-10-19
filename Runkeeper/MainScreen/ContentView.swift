//
//  ContentView.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-15.
//

import SwiftUI

class UserSettings: ObservableObject {
	@Published var isActive: Bool  = false
}

struct ContentView: View {
	@Environment(\.colorScheme) var colorScheme
	var settings = UserSettings()
	
	var body: some View {
		VStack {
			if colorScheme == .light {
				HomeView()
					.transition(.move)
			} else {
				HomeView()
					.transition(.move)
			}
		}
		.animation(.default ,value: colorScheme)
		.environmentObject(settings)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
