//
//  NSError.swift
//  SkyengDictionary
//
//  Created by Elizaveta Semyonova on 09.08.2021.
//

import Foundation

extension NSError {
	static var unknown: NSError {
		NSError(domain: "unknown", code: .zero, userInfo: nil)
	}
}
