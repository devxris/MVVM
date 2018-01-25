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
	
	private var registrationViewModel: RegistrationViewModel!

	// MARK: Storyboard
	
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBAction func save(_ sender: UIBarButtonItem) {
		registrationViewModel = RegistrationViewModel(firstName: firstNameTextField.text,
													  lastName: lastNameTextField.text,
													  email: emailTextField.text,
													  password: passwordTextField.text)
		registrationViewModel.save()
	}
}
