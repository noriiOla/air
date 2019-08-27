//
//  ViewController.swift
//  MonitorJakosciPowietrza2
//
//  Created by Ola on 21/08/2019.
//  Copyright © 2019 Ola. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class MeasureStationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var measureStationsViewModel: MeasureStationViewModel?
    let disposeBag = DisposeBag()
    var dataSource: RxTableViewSectionedReloadDataSource<MeasureStationSection>?
    
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.measureStationsViewModel = MeasureStationViewModel()
        
        setupRefreshControl()
        setupUI()
        setupTableView()
        setupDataSource()
        bindItems()
        measureStationsViewModel?.fetchData()
    }
    
    func setupTableView() {
        self.tableView.backgroundColor = UIColor.clear

        tableView.register(UINib(nibName: "MeasureStationHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "MeasureStationHeader")
        
        tableView.register(MeasureStationTableViewCell.self, forCellReuseIdentifier: "MeasureStationTableViewCell")
        tableView.insertSubview(refreshControl, at: 0)

    }
    
    func setupUI() {
        
    }
    
    func setupRefreshControl() {
        refreshControl.sendActions(for: .valueChanged)
    }
    
    func setupDataSource() {
        self.dataSource = RxTableViewSectionedReloadDataSource<MeasureStationSection>(
            configureCell: { dataSource, tableView, indexPath, item in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MeasureStationTableViewCell", for: indexPath) as? MeasureStationTableViewCell else {
                    return UITableViewCell()
                }
                cell.textLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
                cell.textLabel?.text = item.stationName
                cell.backgroundColor = UIColor.clear
                cell.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
                return cell
        })
        
        self.dataSource?.titleForHeaderInSection = { dataSource, index in
            return ""//dataSource.sectionModels[index].header
        }
        
        self.dataSource?.canEditRowAtIndexPath = { dataSource, indexPath in
            return true
        }
        
        self.dataSource?.canMoveRowAtIndexPath = { dataSource, indexPath in
            return true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func bindItems() {
        guard let _ = dataSource, let _ = measureStationsViewModel else {
            return
        }
        
        
        measureStationsViewModel?.stations
            .do(onNext: {[weak self] _ in self?.refreshControl.endRefreshing() })
            .bind(to: tableView.rx.items(dataSource: dataSource!))
            .disposed(by: disposeBag)

        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        refreshControl.rx.controlEvent(.valueChanged)
            .bind {
                self.measureStationsViewModel?.fetchData()
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(MeasuringStation.self)
            .subscribe({ (station) in
                self.measureStationsViewModel?.selectedStation = station.element
                self.measureStationsViewModel?.router.route(to: MeasureStationsRoutes.measureStationsData.rawValue, from: self, modally: false, animated: true)
            })
            .disposed(by: disposeBag)

    }

}

extension MeasureStationsViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MeasureStationHeader") as? MeasureStationHeader else {
            return UIView()
        }

        headerView.topView.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        headerView.titleLabel.text = dataSource?[section].header ?? ""
        headerView.textLabel?.text = ""
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

