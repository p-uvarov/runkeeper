//
//  RaceDetailsView.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-16.
//

import SwiftUI

struct RaceDetailsView: View {
	@Binding var displayingRace: RaceModel?
	
    var body: some View {
		if let displayingRace = displayingRace {
			VStack {
				Button {
					withAnimation {
						self.displayingRace = nil
					}
				} label: {
					Image(systemName: "xmark")
						.font(.system(size: 22, weight: .bold, design: .default))
				}
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
				
				VStack {
					if let imageName = displayingRace.imageName,
					   !imageName.isEmpty
					{
						RaceLogoImageView(name: imageName, isActive: displayingRace.isActive)
					} else {
						RaceLogoImageView(name: "raceLogoPlaceholder", isActive: displayingRace.isActive)
					}
				}
				.padding(.top, 25)
				
				VStack {
					Text(displayingRace.title ?? "")
						.font(.system(size: 18, weight: .semibold, design: .default))
					Text(displayingRace.subtitle ?? "")
						.font(.system(size: 16, weight: .regular, design: .default))
				}
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
				.padding(.top, 15)
				
				Spacer()
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250)
			.foregroundColor(.white)
			.padding()
			.background(Color(.rkLightGreenishBlue))
			.cornerRadius(15)
			.padding(.horizontal, 40)
			.transition(.moveAndFade)
		}
    }
}
