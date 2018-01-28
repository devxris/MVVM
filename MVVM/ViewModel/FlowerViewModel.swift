//
//  FlowerViewModel.swift
//  MVVM
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct FlowerViewModel {
	
	var name: String
	var description: String
	
	init(flower: Flower) {
		name = flower.name
		description = flower.description
	}
}

