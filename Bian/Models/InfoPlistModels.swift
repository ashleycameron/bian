//
//  InfoPlistModels.swift
//  Bian
//
//  Created by Ashley Cameron on 26/07/2020.
//

import Foundation

enum InfoPlistKey: String, Codable {
	case bundleIcons = "CFBundleIcons"
	case alternateIcons = "CFBundleAlternateIcons"
	case primaryIcon = "CFBundlePrimaryIcon"
}

struct InfoPlistIconEntry: Codable {
	let CFBundleIconFiles: [String]
	let UIPrerenderedIcon: Bool

	init(iconName: String) {
		CFBundleIconFiles = [iconName]
		UIPrerenderedIcon = false
	}
}

struct InfoPlistBundleIcons: Codable {
	struct AltIconsDictionary: Codable {
		let CFBundlePrimaryIcon: InfoPlistIconEntry
	}
	let CFBundleIcons: AltIconsDictionary
}

struct CFBundleIconsEntry: Codable {
	let CFBundleAlternateIcons: [String: InfoPlistIconEntry]
	let CFBundlePrimaryIcon: InfoPlistIconEntry
}
