//
//  Location.swift
//  Trekdar
//
//  Created by Nathaniel Rice on 10/22/25.
//  Create the data structure named Location. We need this data structure to pull one location from the locations.json file

import Foundation
// Struct creates a unique data structure where everytime it is called it makes a unique instance of the data object
// Decodable tells swift that our Location struct is decodable from JSON
struct Location: Decodable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory: String
    
// This is an example for use in our previews. the static is needed here since the example is included in the Location data structure but also the example calls the Location data structure
// This normally would lead to a recursive explosion but if we put static that stops this from happening. Static says that example is created only once and is shared everywhere. don't make infinite copied of example
    static let example = Location(id: 2, name: "Great Smokey Mountains", country: "United States", description: "A great place for the family", more: "What more could you want?", latitude: 35.6532, longitude: -83.5070, heroPicture: "smokies", advisory: "We accept no liability for any visitors eaten alive by bears.")
}
