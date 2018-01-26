//
//  BindingTextField.swift
//  MVVM
//
//  Created by Chris Huang on 26/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import UIKit

class BindingTextField: UITextField {
	
	// MARK: Binding closure

	private var textChanged: ((String) -> Void)? // a call back to indicate text changed
	
	// MARK: Binding func
	
	func bind(_ callback: @escaping (String) -> ()) {
		textChanged = callback
		addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
	}
	
	// MARK: Selector func
	
	@objc private func textFieldDidChange(_ textField: UITextField) {
		guard let text = textField.text else { return }
		textChanged?(text) // execute callback closure
	}
}
