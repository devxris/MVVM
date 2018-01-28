//
//  WebService.swift
//  MVVM
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

private var url = URL(string: "https://flowers.vapor.cloud/flowers")!

class WebService {
	
	static var shared = WebService()
	
	func load(completion: @escaping ([Flower]?) -> ()) {
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let data = data {
				let flowers = try? JSONDecoder().decode([Flower].self, from: data)
				DispatchQueue.main.async { completion(flowers) }
			} else {
				print(error?.localizedDescription ?? "Unknown error")
			}
		}.resume()
	}
}
