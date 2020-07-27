//
//  FoundIconImagesParser.swift
//  Bian
//
//  Created by Ashley Cameron on 27/07/2020.
//

import Foundation

struct FoundIconImagesParser {

	static func uniqueSortedNames(from images: [FoundIconImage]) -> [String] {
		images.map { $0.name }
			.unique()
			.sorted()
	}

	static func mapped(from images: [FoundIconImage]) -> [FoundIconMapped] {
		var buffer: [String: [FoundIconImage]] = [:]
		for image in images {
			var entry = buffer[image.name] ?? []
			entry.append(image)
			buffer[image.name] = entry
		}
		return buffer.map {
			FoundIconMapped(name: $0.key, images: $0.value)
		}.sorted(by: { $0.name > $1.name })
	}
}
