//
//  IndexLevel.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation

class IndexLevel: Codable {
    
    var id: Int8?
    var indexLevelName: String?

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let id = try container.decodeIfPresent(Int8.self, forKey: .id) {
            self.id = id
        }
        
        if let indexLevelName = try container.decodeIfPresent(String.self, forKey: .indexLevelName) {
            self.indexLevelName = indexLevelName
        }
    }
}
