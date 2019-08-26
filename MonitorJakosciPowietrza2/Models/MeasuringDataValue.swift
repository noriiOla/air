//
//  MeasuringDataValue.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation

class MeasuringDataValue: Codable {
    
    var date: String?
    var value: Float?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let date = try container.decodeIfPresent(String.self, forKey: .date) {
            self.date = date
        }
        
        if let value = try container.decodeIfPresent(Float.self, forKey: .value) {
            self.value = value
        }
    }
}
