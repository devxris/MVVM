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
		didSet { registrationViewModel = RegistrationViewModel(userViewModel: selectedUserViewModel) }
	}
	
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
		print(registrationViewModel)
		selectedUserViewModel?.email?.value = "binding@viewModel.toView"
		selectedUserViewModel?.password?.value = "success"
	}
}
