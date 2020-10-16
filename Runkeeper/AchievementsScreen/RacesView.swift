//
//  AchievementsView.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-16.
//

import SwiftUI

struct RacesView: View {
	let races: [RaceModel]
	let type: RaceModel.RaceType
	
	let columns = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
	var body: some View {
		VStack {
			HStack {
				VStack {
					switch type {
					case .personalRecords:
						Text("Personal Records")
					case .virtualRaces:
						Text("Virtual Races")
					}
				}
				.font(.system(size: 15, weight: .medium, design: .default))
				
				Spacer()
				
				if type == RaceModel.RaceType.personalRecords,
				   let completedRaces = races.filter { $0.isCompleted == true }
				{
					Text("\(completedRaces.count) of \(races.count)")
						.font(.system(size: 13, weight: .light, design: .default))
						.foregroundColor(Color(UIColor.darkGray))
				}
			}
			.padding(.horizontal, 20)
			.padding(.vertical, 7)
			.background(Color(UIColor.systemGray6))
			
			LazyVGrid(columns: columns, spacing: 20) {
				ForEach(races, id: \.id) { race in
					VStack {
						if let imageName = race.imageName,
						   !imageName.isEmpty
						{
							RaceLogoImageView(name: imageName, isActive: race.isActive)
						} else {
							RaceLogoImageView(name: "raceLogoPlaceholder", isActive: race.isActive)
						}
						
						VStack (spacing: 3) {
							Text(race.title ?? "")
								.font(.system(size: 13, weight: .medium, design: .default))
							Text(race.subtitle ?? "")
								.font(.system(size: 13, weight: .light, design: .default))
						}
						.frame(width: 150)
						.multilineTextAlignment(.center)
						.opacity(race.isActive ?? true ? 1 : 0.7)
					}
					.padding(.vertical, 12)
				}
			}
			.padding(.horizontal)
			.padding(.vertical, 12)
		}
	}
}
