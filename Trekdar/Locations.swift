//
//  Locations.swift
//  Trekdar
//
//  Created by Nathaniel Rice on 10/22/25.
//

import Foundation
// class is different than struct where it is designed to be shared. in this case
// load locations.json from our app bundle once and share everywhere in our program.
// ObservableObject is a swiftUI type which watches the object looking for changes
// if the object changes than swiftUI will automatically make updates to the UI
class Locations: ObservableObject {
// Adding one property to Locations, hold every location in our json in an array
    let places: [Location]
// return the first item of the array places, return the 1st location
    var primary: Location {
        places[0]
    }
// Requirement of every class is an initilizer. in this case or inotilier will find
// Our json file load it, decode it and assign it to places property.
// we will cover better initializers but this is simpler to understand
    init() {
        // If the URL does not exist or cannot be found crash app
        let url = Bundle.main.url(forResource: "locations", withExtension: "json")!
        // If URL cannot be read crash app
        let data = try! Data(contentsOf: url)
        // If URL cannot be decoded crash app
        places = try! JSONDecoder().decode([Location].self, from: data)
    }
}
