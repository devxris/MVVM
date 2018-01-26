//
//  UsersTableViewController.swift
//  MVVM
//
//  Created by Chris Huang on 25/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {

	// MARK: ViewModel
	
	private var usersListViewModel: UsersListViewModel! {
		didSet {
			tableView.reloadData()
		}
	}
	
	// MARK: ViewController Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		usersListViewModel = UsersListViewModel() // better to have a callback to represent the ViewModel is initialized
	}
		
	// MARK: UITableViewDataSource
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return usersListViewModel?.userViewModels.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = usersListViewModel?.userViewModels[indexPath.row].fullName
		cell.detailTextLabel?.text = usersListViewModel?.userViewModels[indexPath.row].email?.value
		return cell
	}
	
	// MARK: Navigations
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowRegistration" {
			guard let registrationTBC = segue.destination as? RegistrationTableViewController else { return }
			guard let chosenIndexPath = tableView.indexPathForSelectedRow else { return }
			guard let selectedUserViewModel = usersListViewModel?.userViewModels[chosenIndexPath.row] else { return}
			registrationTBC.selectedUserViewModel = selectedUserViewModel
			registrationTBC.selectedIndex = chosenIndexPath.row
			registrationTBC.userInfoChanged = { [weak self] info in
				print(info)
				self?.usersListViewModel = UsersListViewModel()
			}
		}
	}
}
