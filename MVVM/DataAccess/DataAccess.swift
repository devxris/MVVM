//
//  DataAccess.swift
//  MVVM
//
//  Created by Chris Huang on 25/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

class DataAccess { // a singleton
	
	static var shared = DataAccess()
	
	var allUsers = [User]()
	
	private init() {
		allUsers.append(User(firstName: "Steve", lastName: "Jobs", email: "steve.jobs@mail.com", password: "password"))
		allUsers.append(User(firstName: "Elon", lastName: "Musk", email: "elon.musk@mail.com", password: "password"))
		allUsers.append(User(firstName: "Larry", lastName: "Page", email: "larry.page@mail.com", password: "password"))
		allUsers.append(User(firstName: "Tony", lastName: "Stark", email: "tony.stark@mail.com", password: "password"))
	}
	
	func save(_ user: User, at index: Int) {
		allUsers.remove(at: index)
		allUsers.insert(user, at: index)
	}
	
}
