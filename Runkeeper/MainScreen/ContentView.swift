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
