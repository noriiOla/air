//
//  MeasuringStandParam.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation

class MeasuringStandParam: Codable {
    
    var paramName: String?
    var paramFormula: String?

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let paramName = try container.decodeIfPresent(String.self, forKey: .paramName) {
            self.paramName = paramName
        }
        
        if let paramFormula = try container.decodeIfPresent(String.self, forKey: .paramFormula) {
            self.paramFormula = paramFormula
        }
    }
}
