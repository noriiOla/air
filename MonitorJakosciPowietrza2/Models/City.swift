//
//  City.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation

class City: Codable {
    
    var commune: Comune?

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let commune = try container.decodeIfPresent(Comune.self, forKey: .commune) {
            self.commune = commune
        }
    
    }
}
