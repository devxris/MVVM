//
//  UserViewModel.swift
//  MVVM
//
//  Created by Chris Huang on 25/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct UserViewModel { // represent each UITableViewCell
	
	var firstName: String?
	var lastName: String?
	var email: String?
	var password: String?
	var fullName: String {
		return "\(firstName ?? "") \(lastName ?? "")"
	}
	
	init(user: User? = nil) {
		firstName = user?.firstName
		lastName = user?.lastName
		email = user?.email
		password = user?.password
	}
}
