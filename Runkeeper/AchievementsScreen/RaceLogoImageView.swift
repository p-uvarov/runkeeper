//
//  RaceLogoImageView.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-16.
//

import SwiftUI

struct RaceLogoImageView: View {
	var name: String
	var isActive: Bool?
	
    var body: some View {
		Image(name)
			.resizable()
			.aspectRatio(contentMode: .fit)
			.frame(width: 100, height: 100, alignment: .center)
			.shadow(color: Color.gray,
					radius: 7.0,
					x: 0,
					y: 5)
			.padding(.bottom, 5)
			.opacity(isActive ?? true ? 1 : 0.3)
    }
}
