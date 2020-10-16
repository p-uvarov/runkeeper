//
//  AchievementsViewModel.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-16.
//

import Foundation

class AchievementsViewModel: ObservableObject {
	@Published var personalRecordsData: [RaceModel] = getData(of: .personalRecords)
	@Published var virtualRaceData: [RaceModel] = getData(of: .virtualRaces)
	
	private static func getData(of type: RaceModel.RaceType) -> [RaceModel] {
		let data = Bundle.main.decode([RaceModel].self, from: "racesData.json")
		let filteredData = data.filter { $0.type == type }
		let nonNilData = filteredData.compactMap { $0 }
		return nonNilData
	}
}
