//
//  UserViewModel.swift
//  MVVM
//
//  Created by Chris Huang on 25/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct Dynamic<T> {
	
	typealias Listener = (T?) -> Void
	private var listener: Listener?
	
	var value: T? {
		didSet {
			listener?(value)
		}
	}
	
	init(_ value: T?) {
		self.value = value
	}
	
	mutating func bind(_ listener: Listener?) {
		self.listener = listener
		listener?(value)
	}
}

struct UserViewModel { // represent each UITableViewCell
	
	var firstName: Dynamic<String>?
	var lastName: Dynamic<String>?
	var email: Dynamic<String>?
	var password: Dynamic<String>?
	var fullName: String {
		return "\(firstName?.value ?? "") \(lastName?.value ?? "")"
	}
	
	init(user: User? = nil) {
		firstName = Dynamic<String>(user?.firstName)
		lastName = Dynamic<String>(user?.lastName)
		email = Dynamic<String>(user?.email)
		password = Dynamic<String>(user?.password)
	}
}
