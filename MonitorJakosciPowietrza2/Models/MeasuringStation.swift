//
//  MeasuringStation.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation

class MeasuringStation: Codable {
    
    var id: Int?
    var stationName: String?
    var city: City?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let id = try container.decodeIfPresent(Int.self, forKey: .id) {
            self.id = id
        }
        
        if let stationName = try container.decodeIfPresent(String.self, forKey: .stationName) {
            self.stationName = stationName
        }
        
        if let city = try container.decodeIfPresent(City.self, forKey: .city) {
            self.city = city
        }
    }
    
}
