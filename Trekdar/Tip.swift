//
//  Tip.swift
//  Trekdar
//
//  Created by Nathaniel Rice on 10/23/25.
//

import Foundation

struct Tip Decodable {
    let text: String
    let children: [Tip]?
}
