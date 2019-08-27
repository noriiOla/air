//
//  DataViewModel.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 27/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DataViewModel {
    var selectedStation: MeasuringStation?
    var airQualityIndex: BehaviorRelay<AirQualityIndex?> = BehaviorRelay(value: nil)
    let measuringStationService:MeasureStationsService
    var error: String?
    var isLoading = false
    let measuringStand:BehaviorRelay<[MeasuringStand]> = BehaviorRelay(value: [])
    
    init(measuringStationService: MeasureStationsService = MeasureStationsService()) {
        self.measuringStationService = measuringStationService
    }
    
    func getBackroundImage() -> UIImage? {

        guard let qualityIndex = airQualityIndex.value else {
            return R.image.airImage()
        }
        
        let tab = [qualityIndex.stIndexLevel?.id, qualityIndex.so2IndexLevel?.id,
                   qualityIndex.no2IndexLevel?.id, qualityIndex.coIndexLevel?.id,
                   qualityIndex.pm10IndexLevel?.id, qualityIndex.pm25IndexLevel?.id,
                   qualityIndex.o3IndexLevel?.id, qualityIndex.c6h6IndexLevel?.id]
        var worstIndex: Int8 = 0
        for elem in tab {
            if elem != nil {
                if elem! > worstIndex {
                    worstIndex = elem!
                }
            }
        }
        
        switch worstIndex {
        case  _ where worstIndex < 2:
            return R.image.ladne()
            break
        case _ where worstIndex < 4:
            return R.image.umiark()
            break
        case _ where worstIndex < 6:
            return R.image.smog()
            break
        default:
            break
        }
        
        return R.image.airImage()
    }
    
    func fetchData() {

        guard let stationId = selectedStation?.id else {
            return
        }
        measuringStationService.getAirQualityByStation(stationId: stationId) { (airQualityIndex, error) in
            self.isLoading = false
            if let error = error {
                self.error = error
                return
            }
            guard let airQualityIndex = airQualityIndex else {
                self.error = "Something went wrong"
                return
            }
            print("przyszedl air quality")
            self.airQualityIndex.accept(airQualityIndex)
        }
        
        measuringStationService.getAirQualitySensorsDataByStation(stationId: stationId) { (measuringStand, error) in
            self.isLoading = false
            if let error = error {
                self.error = error
                return
            }
            guard let measuringStand = measuringStand else {
                self.error = "Something went wrong"
                return
            }
            
            self.measuringStand.accept(measuringStand)
        }
    }
}
