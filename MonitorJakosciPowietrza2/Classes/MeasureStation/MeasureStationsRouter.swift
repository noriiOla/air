//
//  MeasureStationsRouter.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 27/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import UIKit

enum MeasureStationsRoutes: String {
    case measureStationsData
}
class MeasureStationsRouter: Router {
 
    
    weak var viewModel: MeasureStationViewModel?
    
    
    func route(to routeID: String, from context: UIViewController, modally: Bool, animated: Bool) {
        guard let route = MeasureStationsRoutes(rawValue: routeID) else {
            return
        }
        
        switch route {
        case .measureStationsData:
            guard let selectedStation = viewModel?.selectedStation else {
                return
            }
            let vc = DataViewController.initWith(selecteMeasureStation: selectedStation)
            if modally {
                let nav = UINavigationController.init(rootViewController: vc)
                context.present(nav, animated: animated, completion: nil)
            } else {
                context.navigationController?.pushViewController(vc, animated: animated)
            }
            break
        default:
            break
        }
    }

}
