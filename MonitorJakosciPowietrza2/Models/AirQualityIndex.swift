//
//  AirQualityIndex.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation

class AirQualityIndex: Codable {
    
    var stSourceDataDate: String?
//    var stCalcDate: String?
    var stIndexLevel: IndexLevel?
    
    var so2SourceDataDate: String?
//    var so2CalcDate: String?
    var so2IndexLevel: IndexLevel?
    
    var no2SourceDataDate: String?
//    var no2CalcDate: String?
    var no2IndexLevel: IndexLevel?
    
    var coSourceDataDate: String?
//    var coCalcDate: String?
    var coIndexLevel: IndexLevel?
    
    var pm10SourceDataDate: String?
//    var pm10CalcDate: String?
    var pm10IndexLevel: IndexLevel?
    
    var pm25SourceDataDate: String?
//    var pm25CalcDate: String?
    var pm25IndexLevel: IndexLevel?
    
    var o3SourceDataDate: String?
//    var o3CalcDate: String?
    var o3IndexLevel: IndexLevel?
    
    var c6h6SourceDataDate: String?
//    var c6h6CalcDate: String?
    var c6h6IndexLevel: IndexLevel?
 
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let stSourceDataDate = try container.decodeIfPresent(String.self, forKey: .stSourceDataDate) {
            self.stSourceDataDate = stSourceDataDate
        }
    
//        if let stCalcDate = try container.decodeIfPresent(String.self, forKey: .stCalcDate) {
//            self.stCalcDate = stCalcDate
//        }
        
        if let stIndexLevel = try container.decodeIfPresent(IndexLevel.self, forKey: .stIndexLevel) {
            self.stIndexLevel = stIndexLevel
        }
        
        
        if let so2SourceDataDate = try container.decodeIfPresent(String.self, forKey: .so2SourceDataDate) {
            self.so2SourceDataDate = so2SourceDataDate
        }
        
//        if let so2CalcDate = try container.decodeIfPresent(String.self, forKey: .so2CalcDate) {
//            self.so2CalcDate = so2CalcDate
//        }
        
        if let so2IndexLevel = try container.decodeIfPresent(IndexLevel.self, forKey: .so2IndexLevel) {
            self.so2IndexLevel = so2IndexLevel
        }
        
        
        if let no2SourceDataDate = try container.decodeIfPresent(String.self, forKey: .no2SourceDataDate) {
            self.no2SourceDataDate = no2SourceDataDate
        }
        
//        if let no2CalcDate = try container.decodeIfPresent(String.self, forKey: .no2CalcDate) {
//            self.no2CalcDate = no2CalcDate
//        }
        
        if let no2IndexLevel = try container.decodeIfPresent(IndexLevel.self, forKey: .no2IndexLevel) {
            self.no2IndexLevel = no2IndexLevel
        }
        
        
        if let coSourceDataDate = try container.decodeIfPresent(String.self, forKey: .coSourceDataDate) {
            self.coSourceDataDate = coSourceDataDate
        }
        
//        if let coCalcDate = try container.decodeIfPresent(String.self, forKey: .coCalcDate) {
//            self.coCalcDate = coCalcDate
//        }
        
        if let coIndexLevel = try container.decodeIfPresent(IndexLevel.self, forKey: .coIndexLevel) {
            self.coIndexLevel = coIndexLevel
        }
        
        
        if let pm10SourceDataDate = try container.decodeIfPresent(String.self, forKey: .pm10SourceDataDate) {
            self.pm10SourceDataDate = pm10SourceDataDate
        }
        
//        if let pm10CalcDate = try container.decodeIfPresent(String.self, forKey: .pm10CalcDate) {
//            self.pm10CalcDate = pm10CalcDate
//        }
        
        if let pm10IndexLevel = try container.decodeIfPresent(IndexLevel.self, forKey: .pm10IndexLevel) {
            self.pm10IndexLevel = pm10IndexLevel
        }
        
        
        if let pm25SourceDataDate = try container.decodeIfPresent(String.self, forKey: .pm25SourceDataDate) {
            self.pm25SourceDataDate = pm25SourceDataDate
        }
        
//        if let pm25CalcDate = try container.decodeIfPresent(String.self, forKey: .pm25CalcDate) {
//            self.pm25CalcDate = pm25CalcDate
//        }
        
        if let pm25IndexLevel = try container.decodeIfPresent(IndexLevel.self, forKey: .pm25IndexLevel) {
            self.pm25IndexLevel = pm25IndexLevel
        }
        
        if let o3SourceDataDate = try container.decodeIfPresent(String.self, forKey: .o3SourceDataDate) {
            self.o3SourceDataDate = o3SourceDataDate
        }
        
//        if let o3CalcDate = try container.decodeIfPresent(String.self, forKey: .o3CalcDate) {
//            self.o3CalcDate = o3CalcDate
//        }
        
        if let o3IndexLevel = try container.decodeIfPresent(IndexLevel.self, forKey: .o3IndexLevel) {
            self.o3IndexLevel = o3IndexLevel
        }
        
        
        if let c6h6SourceDataDate = try container.decodeIfPresent(String.self, forKey: .c6h6SourceDataDate) {
            self.c6h6SourceDataDate = c6h6SourceDataDate
        }
        
//        if let c6h6CalcDate = try container.decodeIfPresent(String.self, forKey: .c6h6CalcDate) {
//            self.c6h6CalcDate = c6h6CalcDate
//        }
        
        if let c6h6IndexLevel = try container.decodeIfPresent(IndexLevel.self, forKey: .c6h6IndexLevel) {
            self.c6h6IndexLevel = c6h6IndexLevel
        }
    }
}
