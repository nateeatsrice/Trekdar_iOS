//
//  Locations.swift
//  Trekdar
//
//  Created by Nathaniel Rice on 10/22/25.
//

import Foundation

class Locations: ObservableObject {
    let places: [Location]
// return the first item of the array places, return the 1st location
    var primary: Location {
        places[0]
    }

    init() {
        // If the URL does not exist or cannot be found crash app
        let url = Bundle.main.url(forResource: "locations", withExtension: "json")!
        // If URL cannot be read crash app
        let data = try! Data(contentsOf: url)
        // If URL cannot be decoded crash app
        places = try! JSONDecoder().decode([Location].self, from: data)
    }
}
