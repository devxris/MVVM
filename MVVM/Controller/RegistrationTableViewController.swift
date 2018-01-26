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
		didSet {
			registrationViewModel = RegistrationViewModel(userViewModel: selectedUserViewModel)
			registrationViewModel.index = selectedIndex
		}
	}
	
	var selectedIndex: Int?
	
	var userInfoChanged: ((String) -> ())?
	
	private var registrationViewModel: RegistrationViewModel!
	
	// MARK: ViewController Life Cycles
	
	override func viewDidLoad() {
		super.viewDidLoad()

		/* Binding ViewModel to View */
		selectedUserViewModel?.firstName?.bind { [weak self] in self?.firstNameTextField?.text = $0 }
		selectedUserViewModel?.lastName?.bind { [weak self] in self?.lastNameTextField?.text = $0 }
		selectedUserViewModel?.email?.bind { [weak self] in self?.emailTextField?.text = $0 }
		selectedUserViewModel?.password?.bind { [weak self] in self?.passwordTextField?.text = $0 }
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
		var message = ""
		if let email = registrationViewModel.email, email.isEmpty {
			message = "Email is empty!"
		}
		if let password = registrationViewModel.password, password.isEmpty {
			message += " Password is empty!"
		}
		if message.isEmpty {
			registrationViewModel.save()
			userInfoChanged?("user changed")
			navigationController?.popViewController(animated: true)
		} else {
			let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			present(alert, animated: true, completion: nil)
		}
	}
}
