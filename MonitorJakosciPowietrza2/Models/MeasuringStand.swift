//
//  MeasuringStand.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation

class MeasuringStand: Codable {
    
    var id: Int?
    var param: MeasuringStandParam?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let id = try container.decodeIfPresent(Int.self, forKey: .id) {
            self.id = id
        }
        
        if let param = try container.decodeIfPresent(MeasuringStandParam.self, forKey: .param) {
            self.param = param
        }
    }
}
