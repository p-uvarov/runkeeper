//
//  ContentView.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-15.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel = AchievementsViewModel()
		
	var body: some View {
		NavigationView {
			ScrollView {
				AchievementsView(races: viewModel.personalRecordsData, type: .personalRecords)
				AchievementsView(races: viewModel.virtualRaceData, type: .virtualRaces)
			}
			.navigationBarTitle("Achievements", displayMode: .inline)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
