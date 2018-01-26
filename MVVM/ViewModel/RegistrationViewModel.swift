//
//  RegistrationViewModel.swift
//  MVVM
//
//  Created by Chris Huang on 25/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct RegistrationViewModel { // represent the whole UITableView
	
	var firstName: String?
	var lastName: String?
	var email: String?
	var password: String?
	
	init(firstName: String? = nil, lastName: String? = nil, email: String? = nil, password: String? = nil) {
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
		self.password = password
	}
	
	init(userViewModel: UserViewModel?) {
		firstName = userViewModel?.firstName?.value
		lastName = userViewModel?.lastName?.value
		email = userViewModel?.email?.value
		password = userViewModel?.password?.value
	}
	
	func save() {
		let _ = User(viewModel: self)
		// save the user to DataAccess, e.g. DataAccess.save()
	}
}
