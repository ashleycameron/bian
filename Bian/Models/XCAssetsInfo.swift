//
//  XCAssetsInfo.swift
//  Bian
//
//  Created by Ashley Cameron on 27/07/2020.
//

import Foundation

struct XCAssetsInfo: Codable {
	let author: String
	let version: String
}

extension XCAssetsInfo {

	static var `default`: XCAssetsInfo {
		XCAssetsInfo(author: "xcode", version: "1")
	}
}
