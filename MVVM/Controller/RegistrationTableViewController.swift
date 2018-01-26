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
	}
	
	// MARK: ViewController Life Cycles
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateUI()
	}

	// MARK: Storyboard
	
	@IBOutlet private weak var firstNameTextField: UITextField!
	@IBOutlet private weak var lastNameTextField: UITextField!
	@IBOutlet private weak var emailTextField: UITextField!
	@IBOutlet private weak var passwordTextField: UITextField!
	
	@IBAction private func save(_ sender: UIBarButtonItem) {
		// populate ViewModel from View
		registrationViewModel = RegistrationViewModel(firstName: firstNameTextField.text,
													  lastName: lastNameTextField.text,
													  email: emailTextField.text,
													  password: passwordTextField.text)
		registrationViewModel.save()
	}
}
