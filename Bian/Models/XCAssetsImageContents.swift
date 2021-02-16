//
//  XCAssetsImageContents.swift
//  Bian
//
//  Created by Ashley Cameron on 27/07/2020.
//

import Foundation

struct XCAssetsImageContents: Codable {
	struct Image: Codable {
		let filename: String?
		let idiom: String
		let scale: String
	}
	let images: [Image]
	let info: XCAssetsInfo
}

extension XCAssetsImageContents {

	init(icon: FoundIconMapped) {
		self.info = .default
		self.images = icon.images.sorted(by: { $0.scale.rawValue < $1.scale.rawValue }).map {
			XCAssetsImageContents.Image(
				filename: $0.filename,
				idiom: "universal",
				scale: $0.scale.rawValue
			)
		}
	}
}
