//
//  User.swift
//  MVVM
//
//  Created by Chris Huang on 25/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct User {
	
	var firstName: String
	var lastName: String
	var email: String
	var password: String
	
	init(firstName: String, lastName: String, email: String, password: String) {
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
		self.password = password
	}
	
	// convert RegistrationViewModel to User
	init(viewModel: RegistrationViewModel) {
		self.firstName = viewModel.firstName ?? ""
		self.lastName = viewModel.lastName ?? ""
		self.email = viewModel.email ?? ""
		self.password = viewModel.password ?? ""
	}
}
