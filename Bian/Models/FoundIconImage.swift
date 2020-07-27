//
//  FoundIconImage.swift
//  Bian
//
//  Created by Ashley Cameron on 27/07/2020.
//

import Foundation

struct FoundIconImage: Codable {
	enum Scale: String, Codable {
		case x1 = "1x"
		case x2 = "2x"
		case x3 = "3x"
	}
	let url: URL
	let filename: String
	let scale: Scale
	let name: String
}

extension FoundIconImage {

	init?(fileURL: URL) {
		let name = fileURL.deletingPathExtension().lastPathComponent
		guard name.first != ".", name.contains("@") else { return nil }
		let split = name.split(separator: "@")
		guard split.count == 2, let scale = Scale(rawValue: String(split[1])) else {
			return nil
		}
		self.url = fileURL
		self.filename = fileURL.lastPathComponent
		self.scale = scale
		self.name = String(split[0])
	}
}

struct FoundIconMapped {
	let name: String
	let images: [FoundIconImage]
}
