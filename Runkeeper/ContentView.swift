//
//  ContentView.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-15.
//

import SwiftUI

struct RaceModel {
	
}

struct ContentView: View {
	let data = (1...1000).map { "Item \($0)" }

	let columns = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]

	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns, spacing: 20) {
				ForEach(data, id: \.self) { item in
					Text(item)
				}
			}
			.padding(.horizontal)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
