//
//  AchievementsView.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-16.
//

import SwiftUI

struct AchievementsView: View {
	enum AlertType: String, Identifiable {
		var id: String { rawValue }
		
		case firstOption
		case secondOption
		case thirdOption
	}
	
	@ObservedObject var viewModel = AchievementsViewModel()
	@State var isShowingActionSheet = false
	@State var alertType: AlertType?
	@State var displayingRace: RaceModel?
	
    var body: some View {
		ZStack {
			ScrollView {
				RacesView(races: viewModel.personalRecordsData, type: .personalRecords, displayingRace: $displayingRace)
				RacesView(races: viewModel.virtualRaceData, type: .virtualRaces, displayingRace: $displayingRace)
			}
			.navigationBarTitle("Achievements", displayMode: .inline)
			.navigationBarItems(trailing: optionsButton)
			.actionSheet(isPresented: $isShowingActionSheet) {
				ActionSheet(title: Text("Settings").font(.system(size: 14)), message: nil, buttons: [
					.destructive(Text("Option 1")) { alertType = .firstOption },
					.default(Text("Option 2")) { alertType = .secondOption },
					.default(Text("Option 3")) { alertType = .thirdOption },
					.cancel()
				])
			}
			.alert(item: $alertType) { (alertType) -> Alert in
				switch alertType {
				case .firstOption:
					return Alert(title: Text("Option 1 was tapped"))
				case .secondOption:
					return Alert(title: Text("Option 2 was tapped"))
				case .thirdOption:
					return Alert(title: Text("Option 3 was tapped"))
				}
			}
			
			VStack {
				if displayingRace != nil {
					RaceDetailsView(displayingRace: $displayingRace)
				}
			}
		}
	}
	
	var optionsButton: some View {
		Button {
			isShowingActionSheet = true
		} label: {
			Image(systemName: "ellipsis")
				.rotationEffect(.degrees(90))
				.foregroundColor(.white)
				.font(.system(size: 17, weight: .semibold, design: .default))
				.padding(.leading, 15)
				.padding(.vertical, 15)
		}

	}
}
