//
//  FlowersListViewModel.swift
//  MVVM
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct FlowersListViewModel {
	
	var flowerViewModels = [FlowerViewModel]()
	
	/*
	init(flowers: [Flower]) {
		flowerViewModels = flowers.map { FlowerViewModel(flower: $0) }
	}*/
	
	mutating func populate(_ flowers: [Flower]) {
		flowerViewModels = flowers.map { FlowerViewModel(flower: $0) }
	}
}
