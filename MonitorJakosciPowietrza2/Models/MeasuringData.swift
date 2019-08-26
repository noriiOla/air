//
//  MeasuringData.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation

class MeasuringData: Codable {
    
    var values: [MeasuringDataValue]?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let values = try container.decodeIfPresent([MeasuringDataValue].self, forKey: .values) {
            self.values = values
        }
    }

}
