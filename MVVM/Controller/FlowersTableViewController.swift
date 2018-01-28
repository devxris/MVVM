//
//  FlowersTableViewController.swift
//  MVVM
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import UIKit

class FlowersTableViewController: UITableViewController {
	
	// MARK: ViewModels
	
	private var flowersListViewModel: FlowersListViewModel!

	// MARK: ViewController Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		flowersListViewModel = FlowersListViewModel(webService: WebService.shared) {
			self.tableView.reloadData()
		}
	}
	
	// MARK: UITableViewDataSource
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return flowersListViewModel.flowerViewModels.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = flowersListViewModel.flowerViewModels[indexPath.row].name
		cell.detailTextLabel?.text = flowersListViewModel.flowerViewModels[indexPath.row].description
		return cell
	}
}
