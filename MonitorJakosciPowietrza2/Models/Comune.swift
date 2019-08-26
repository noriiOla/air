//
//  Comune.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation

class Comune: Codable {
    
    var provinceName: String?

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let provinceName = try container.decodeIfPresent(String.self, forKey: .provinceName) {
            self.provinceName = provinceName
        }

    }
}
