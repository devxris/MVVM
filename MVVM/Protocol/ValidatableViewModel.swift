//
//  ValidatedViewModel.swift
//  MVVM
//
//  Created by Chris Huang on 26/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct BrokenRule {
	
	var propertyName: String
	var message: String
}

protocol ValidatableViewModel {
	var brokenRule: [BrokenRule] { get set }
	var isValid: Bool { mutating get }
}

