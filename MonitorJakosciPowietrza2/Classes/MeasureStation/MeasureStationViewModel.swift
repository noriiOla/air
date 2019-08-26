//
//  MeasureStationViewModel.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

struct MeasureStationSection {
    var header: String
    var items: [Item]
}

extension MeasureStationSection: SectionModelType {
    typealias Item = MeasuringStation
    
    init(original: MeasureStationSection, items: [Item]) {
        self = original
        self.items = items
    }
}

class MeasureStationViewModel {

    var stations: BehaviorRelay<[MeasureStationSection]> = BehaviorRelay(value: [])

    let measureStationServiec: MeasureStationsService!
    var isLoading: Bool
    var error: String?
    
    init(measuringStationService: MeasureStationsService = MeasureStationsService()) {
        self.measureStationServiec = measuringStationService
        isLoading = false
    }
    
    
    func fetchData() {

        self.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.measureStationServiec.getMeasureStations { (stations, error) in
                if let error = error {
                    self.error = error
                    self.isLoading = false
                    return
                }
                self.error = nil
                self.isLoading = false
                guard let stations = stations else {
                    self.error = "Something went wrong"
                    return
                }
                self.stations.accept(self.prepareStationsDictionary(stations: stations))
            }
        })
    }
    
    private func prepareStationsDictionary(stations: [MeasuringStation]) -> [MeasureStationSection] {
        var dictionary = [String: [MeasuringStation]]()
        for station in stations {
            if let provinceName = station.city?.commune?.provinceName {
                if dictionary[provinceName] == nil {
                    dictionary[provinceName] = []
                }
                dictionary[provinceName]?.append(station)
            }
        }
        
        let sortedDictionary = dictionary.sorted { (item1, item2) -> Bool in
            return item1.key < item2.key
        }
        
        var dictionary2: [MeasureStationSection] = []

        for elem in sortedDictionary {
            let sortedItems = elem.value.sorted { (station1, station2) -> Bool in
                guard let stationName1 = station1.stationName, let stationName2 = station2.stationName else {
                    return false
                }
                return stationName1 < stationName2
            }
            dictionary2.append(MeasureStationSection(header: elem.key, items: sortedItems))
        }
        
        return dictionary2
    }
    
}


