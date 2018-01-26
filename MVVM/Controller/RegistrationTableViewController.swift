//
//  RegistrationTableViewController.swift
//  MVVM
//
//  Created by Chris Huang on 25/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
	
	// MARK: ViewModel
	
	var selectedUserViewModel: UserViewModel? {
		didSet { updateUI() }
	}
	
	private var registrationViewModel: RegistrationViewModel!
	
	// MARK: Private funcs
	
	private func updateUI() { // populate View from ViewModel
		firstNameTextField?.text = selectedUserViewModel?.firstName
		lastNameTextField?.text = selectedUserViewModel?.lastName
		emailTextField?.text = selectedUserViewModel?.email
		passwordTextField?.text = selectedUserViewModel?.password
		
		registrationViewModel = RegistrationViewModel(firstName: selectedUserViewModel?.firstName,
													  lastName: selectedUserViewModel?.lastName,
													  email: selectedUserViewModel?.email,
													  password: selectedUserViewModel?.password)
	}
	
	// MARK: ViewController Life Cycles
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateUI()
	}

	// MARK: Storyboard
	
	/* Binding View to ViewModel */
	@IBOutlet private weak var firstNameTextField: BindingTextField! {
		didSet { firstNameTextField?.bind { [weak self] in self?.registrationViewModel.firstName = $0 } }
	}
	@IBOutlet private weak var lastNameTextField: BindingTextField! {
		didSet { lastNameTextField?.bind { [weak self] in self?.registrationViewModel.lastName = $0 } }
	}
	@IBOutlet private weak var emailTextField: BindingTextField! {
		didSet { emailTextField?.bind { [weak self] in self?.registrationViewModel.email = $0 } }
	}
	@IBOutlet private weak var passwordTextField: BindingTextField! {
		didSet { passwordTextField?.bind { [weak self] in self?.registrationViewModel.password = $0 } }
	}
	
	@IBAction private func save(_ sender: UIBarButtonItem) {
		print(registrationViewModel)
	}
}
