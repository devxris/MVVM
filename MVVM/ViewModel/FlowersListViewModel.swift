//
//  FlowersListViewModel.swift
//  MVVM
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

class FlowersListViewModel {
	
	var flowerViewModels = [FlowerViewModel]()
	
	func populate(_ flowers: [Flower]) {
		flowerViewModels = flowers.map { FlowerViewModel(flower: $0) }
	}
	
	/* Calling WebService in ViewModel */
	init(webService: WebService, completion: @escaping () -> ()) {
		webService.load { flowers in
			if let flowers = flowers {
				let newFlowerModels = flowers.map { FlowerViewModel(flower: $0) }
				self.flowerViewModels = newFlowerModels
				DispatchQueue.main.async { completion() }
			}
		}
	}
}
