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
	
	@Binding var displayingRace: RaceModel?
	
	let columns = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
	var body: some View {
		ZStack {
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
							.foregroundColor(Color(.rkDarkGray))
					}
				}
				.padding(.horizontal, 20)
				.padding(.vertical, 7)
				.background(Color(.rkSystemGray6))
				
				LazyVGrid(columns: columns, spacing: 20) {
					ForEach(races, id: \.id) { race in
						Button {
							withAnimation {
								self.displayingRace = race
							}
						} label: {
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
								.foregroundColor(Color(.rkBlack))
								.frame(width: 150)
								.multilineTextAlignment(.center)
								.opacity(race.isActive ?? true ? 1 : 0.7)
							}
							.padding(.vertical, 12)
						}

					}
				}
				.padding(.horizontal)
				.padding(.vertical, 12)
			}
		}
	}
}

extension AnyTransition {

	static var moveAndFade: AnyTransition {
		let insertion = AnyTransition.move(edge: .trailing)
			.combined(with: .opacity)

		let removal = AnyTransition.scale
			.combined(with: .opacity)

		return .asymmetric(insertion: insertion, removal: removal)
	}
	
	static var move: AnyTransition {
		let insertion = AnyTransition.move(edge: .top)

		let removal = AnyTransition.move(edge: .bottom)

		return .asymmetric(insertion: insertion, removal: removal)
	}

}
