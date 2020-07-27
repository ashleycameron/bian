//
//  BianError.swift
//  Bian
//
//  Created by Ashley Cameron on 27/07/2020.
//

import Foundation

enum BianError: Error {
	case invalidPath
	case invalidData
	case failedToFindInfoPlist
	case failedToGenerateOutputSwiftFile
}
