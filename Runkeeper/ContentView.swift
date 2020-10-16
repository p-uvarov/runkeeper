//
//  ContentView.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-15.
//

import SwiftUI

extension ForEach where Data.Element: Hashable, ID == Data.Element, Content: View {
	init(values: Data, content: @escaping (Data.Element) -> Content) {
		self.init(values, id: \.self, content: content)
	}
}

struct RaceModel: Codable, Hashable {
	enum RaceType: Int, Codable {
		case personalRecords = 1
		case virtualRaces = 2
	}
	
	var id: Int
	var title: String?
	var subtitle: String?
	var imageName: String?
	var isActive: Bool?
	var isCompleted: Bool?
	var type: RaceType?
	
	private enum CodingKeys: String, CodingKey {
		case id
		case title
		case subtitle
		case imageName
		case isActive
		case isCompleted
		case type
	}
}

class ViewModel: ObservableObject {
	@Published var personalRecordsData: [RaceModel] = getData(of: .personalRecords)
	@Published var virtualRaceData: [RaceModel] = getData(of: .virtualRaces)
	
	private static func getData(of type: RaceModel.RaceType) -> [RaceModel] {
		let data = Bundle.main.decode([RaceModel].self, from: "racesData.json")
		let filteredData = data.filter { $0.type == type }
		let nonNilData = filteredData.compactMap { $0 }
		return nonNilData
	}
}

struct ContentView: View {
	@ObservedObject var viewModel = ViewModel()

	var body: some View {
		ScrollView {
			RacesView(races: viewModel.personalRecordsData, type: .personalRecords)
			RacesView(races: viewModel.virtualRaceData, type: .virtualRaces)
		}
	}
}

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
							Image(imageName)
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(width: 100, height: 100, alignment: .center)
								.shadow(color: Color.gray,
										radius: 7.0,
										x: 0,
										y: 5)
								.padding(.bottom, 5)
								.opacity(race.isActive ?? true ? 1 : 0.3)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
