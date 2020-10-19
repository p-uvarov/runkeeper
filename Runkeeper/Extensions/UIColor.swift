//
//  UIColor.swift
//  Runkeeper
//
//  Created by Pavel Uvarov on 2020-10-16.
//

import UIKit

extension UIColor {
	public convenience init(hex:String) {
		var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

		if (cString.hasPrefix("#")) {
			cString.remove(at: cString.startIndex)
		}

		if ((cString.count) != 6) {
			self.init(.gray)
			return
		}

		var rgbValue:UInt64 = 0
		Scanner(string: cString).scanHexInt64(&rgbValue)

		self.init(
			red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha: CGFloat(1.0)
		)
	}
	
	static var rkLightGreenishBlue: UIColor {
		return UITraitCollection.current.userInterfaceStyle == .dark
			? .gray
			: UIColor(hex: "#63c6d4")
	}
	
	static var rkDarkGray: UIColor {
		return UITraitCollection.current.userInterfaceStyle == .dark
			? UIColor(hex: "#fafafa")
			: .darkGray
	}
	
	static var rkSystemGray6: UIColor {
		return UITraitCollection.current.userInterfaceStyle == .dark
			? .systemGray
			: .systemGray6
	}
	
	static var rkBlack: UIColor {
		return UITraitCollection.current.userInterfaceStyle == .dark
			? .white
			: .black
	}
	
	static var rkShadowGray: UIColor {
		UIColor.gray.withAlphaComponent(UITraitCollection.current.userInterfaceStyle == .dark ? 0 : 1)
	}
}
