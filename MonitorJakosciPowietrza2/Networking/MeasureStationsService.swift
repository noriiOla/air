//
//  MeasureStationsService.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import Alamofire

class MeasureStationsService {
    
    func getMeasureStations(completionHandler: @escaping ([MeasuringStation]?, String?) -> ()) {
        guard let url = URL(string: Urls.measuringStations) else {
            return
        }
        
        Alamofire.request(url, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default , headers: nil)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    if let json = response.data {
                        do{
                            let decoder = JSONDecoder()
                            let stations = try decoder.decode([MeasuringStation].self, from: json)
                            completionHandler(stations, nil)
                        }catch let _{
                            completionHandler(nil, "Encoding error")
                        }
                    }else{
                        completionHandler(nil, "Encoding error")
                    }
                case .failure(let error):
                    print("failure")

                    completionHandler(nil, error.localizedDescription)
                }
        }
        
    }
}
