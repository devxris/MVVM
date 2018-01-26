//
//  RegistrationViewModel.swift
//  MVVM
//
//  Created by Chris Huang on 25/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct RegistrationViewModel: ValidatableViewModel { // represent the whole UITableView
	
	var firstName: String?
	var lastName: String?
	var email: String?
	var password: String?
	var index: Int?
	
	init(firstName: String? = nil, lastName: String? = nil, email: String? = nil, password: String? = nil, index: Int? = nil) {
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
		self.password = password
		self.index = index
	}
	
	init(userViewModel: UserViewModel?) {
		firstName = userViewModel?.firstName?.value
		lastName = userViewModel?.lastName?.value
		email = userViewModel?.email?.value
		password = userViewModel?.password?.value
	}
	
	func save() {
		let savedUser = User(viewModel: self)
		// save the user to DataAccess, e.g. DataAccess.save()
		if let index = index {
			DataAccess.shared.save(savedUser, at: index)
		}
	}
	
	// MARK: ValidatableViewModel protocol
	
	var brokenRule: [BrokenRule] = []
	
	var isValid: Bool {
		mutating get {
			brokenRule = [BrokenRule]()
			self.validate()
			return brokenRule.count == 0 ? true : false
		}
	}
}

extension RegistrationViewModel {
	
	private mutating func validate() {
		if let email = email, email.isEmpty {
			brokenRule.append(BrokenRule(propertyName: "email", message: "Email is required!"))
		}
		if let password = password, password.isEmpty {
			brokenRule.append(BrokenRule(propertyName: "password", message: "Password is required!"))
		}
	}
}
