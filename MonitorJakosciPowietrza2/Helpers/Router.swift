//
//  Router.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 27/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import UIKit

protocol Router {
    func route(
        to routeID: String,
        from context: UIViewController,
        modally: Bool,
        animated: Bool
    )
}
