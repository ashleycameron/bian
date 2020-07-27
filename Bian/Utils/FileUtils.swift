//
//  FileUtils.swift
//  Bian
//
//  Created by Ashley Cameron on 27/07/2020.
//

import Foundation

struct FileUtils {

	static func write<T>(_ object: T, to path: String, encoder: JSONEncoder) throws where T: Encodable {
		let data = try encoder.encode(object)
		let url = URL(fileURLWithPath: path)
		try data.write(to: url)
	}

	static func createPlist(dictionary: NSDictionary, path: String) throws {
		let url = URL(fileURLWithPath: path)
		try dictionary.write(to: url)
	}
}
