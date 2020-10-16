//
//  ContentView.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-15.
//

import SwiftUI

struct ContentView: View {
	@State private var isActive: Bool  = false
	
	var body: some View {
		NavigationView {
			NavigationLink(destination: AchievementsView(), isActive: $isActive) {
				Text("Show Detail View")
					.foregroundColor(.blue)
			}
			.navigationBarTitle(isActive ? "" : "Main" , displayMode: .inline)
		}
		.accentColor(.white)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
