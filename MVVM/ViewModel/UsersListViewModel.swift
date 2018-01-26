//
//  UsersListViewModel.swift
//  MVVM
//
//  Created by Chris Huang on 25/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct UsersListViewModel { // represent the whole UITableView
	
	var userViewModels = [UserViewModel]()
	
	private var userViewModelsChanged: ((String) -> ())?
	
	init() { // get all Users from DataAccess and convert to UserViewModel
		userViewModels = DataAccess.shared.allUsers.flatMap { UserViewModel(user: $0) }
	}
}
