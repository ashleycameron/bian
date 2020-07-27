//
//  XCAssetsGenerator.swift
//  Bian
//
//  Created by Ashley Cameron on 27/07/2020.
//

import Foundation

struct XCAssetsGenerator {

	// MARK: - Interface

	static func create(from icons: [FoundIconMapped], path: String, fileManager: FileManager) throws {
		try createXCAssetsFolder(path: path, fileManager: fileManager)

		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted

		let rootContents = XCAssetsRootContents(info: .default)
		try FileUtils.write(rootContents, to: "\(path)/Contents.json", encoder: encoder)

		for icon in icons {
			try createImageAsset(
				icon: icon,
				rootPath: path,
				fileManager: fileManager,
				encoder: encoder
			)
		}
	}

	// MARK: - Utilities

	private static func createXCAssetsFolder(path: String, fileManager: FileManager) throws {
		var isDir = ObjCBool(true)
		if fileManager.fileExists(atPath: path, isDirectory: &isDir) {
			try fileManager.removeItem(atPath: path)
		}
		try fileManager.createDirectory(
			atPath: path,
			withIntermediateDirectories: true,
			attributes: nil
		)
	}

	private static func createImageAsset(icon: FoundIconMapped, rootPath: String, fileManager: FileManager, encoder: JSONEncoder) throws {
		let imageSetPath = "\(rootPath)/\(icon.name).imageset"
		try fileManager.createDirectory(
			atPath: imageSetPath,
			withIntermediateDirectories: true,
			attributes: nil
		)
		let imageContents = XCAssetsImageContents(icon: icon)
		try FileUtils.write(imageContents, to: "\(imageSetPath)/Contents.json", encoder: encoder)

		for image in icon.images {
			try fileManager.copyItem(
				at: image.url,
				to: URL(fileURLWithPath: "\(imageSetPath)/\(image.filename)")
			)
		}
	}
}
