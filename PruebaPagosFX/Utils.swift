//
//  Utils.swift
//  PruebaPagosFX
//
//  Created by Ivan Cabezon on 02/04/2020.
//  Copyright © 2020 Ivan Cabezon. All rights reserved.
//

import Foundation

public typealias JSON = [String: Any]

public func localizedString(_ key: String) -> String {
	return NSLocalizedString(key, comment: "")
}

public func localizedString(_ key: String, args: CVarArg...) -> String {
	return String(format: localizedString(key), arguments: args)
}

public func safeprint(_ entry: Any) {
	#if DEBUG
	print("DEBUG: \(Date().localTime) ** \(entry)")
	#endif
}
