//
//  Urls.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation

struct Urls {
    private init() {}
    
    static let measuringStations = "http://api.gios.gov.pl/pjp-api/rest/station/findAll"
    static let measuringStands = "http://api.gios.gov.pl/pjp-api/rest/station/sensors/"
    static let measuringData = "http://api.gios.gov.pl/pjp-api/rest/data/getData/"
    static let airQualityIndex = "http://api.gios.gov.pl/pjp-api/rest/aqindex/getIndex/"
}
