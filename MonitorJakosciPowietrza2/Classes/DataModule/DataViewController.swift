//
//  DataViewController.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 27/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    static func initWith(selecteMeasureStation: MeasuringStation) -> DataViewController {

        let vc = R.storyboard.data.instantiateInitialViewController()!
        vc.dataViewModel = DataViewModel()
        vc.dataViewModel?.selectedStation = selecteMeasureStation
        return vc
    }
    
    var dataViewModel: DataViewModel?

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
