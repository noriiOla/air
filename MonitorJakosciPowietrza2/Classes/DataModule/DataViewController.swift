//
//  DataViewController.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 27/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DataViewController: UIViewController {

    static func initWith(selecteMeasureStation: MeasuringStation) -> DataViewController {
        let vc = R.storyboard.data.instantiateInitialViewController()!
        vc.dataViewModel = DataViewModel()
        vc.dataViewModel?.selectedStation = selecteMeasureStation
        return vc
    }
    
    var dataViewModel: DataViewModel?
    let disposeBag = DisposeBag()

    @IBOutlet weak var backgroundImageItem: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindItems()
        dataViewModel?.fetchData()
    }
    
    func setupUI() {
        self.backgroundImageItem.image = dataViewModel?.getBackroundImage()
    }
    
    func bindItems() {
        guard let _ = dataViewModel else {
            return
        }
        
        dataViewModel!.airQualityIndex
            .subscribe({ (index) in
                self.backgroundImageItem.image = self.dataViewModel?.getBackroundImage()
            })
            .disposed(by: disposeBag)
    }
}
