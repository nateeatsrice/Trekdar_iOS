//
//  Tip.swift
//  Trekdar
//
//  Created by Nathaniel Rice on 10/23/25.
//

import Foundation

struct Tip: Decodable { // Decodable since we are pulling from JSON
    let text: String
    let children: [Tip]? // ? this is optionality where the children may or not be there in json
}
