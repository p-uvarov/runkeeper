//
//  RaceModel.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-16.
//

import Foundation

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
