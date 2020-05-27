//
//  ColorListTableViewModel.swift
//  MVVMExercise
//
//  Created by Bunny Bhargav on 23/05/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation
import UIKit

class ColorTableViewViewModel: NSObject {
    var coulorData: [Color]
    var tableTitle: String
    fileprivate var selectedIndex: IndexPath?
    fileprivate weak var view: ColorTableViewDelegate?
    init(title: String, view: ColorTableViewDelegate?) {
        self.tableTitle = title
        self.view = view
        coulorData = []
        if let redModel = Color(colorname: "Red", red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), let blueModel = Color(colorname: "Blue", red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), let greenModel = Color(colorname: "Green", red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0) {
            self.coulorData.append(redModel)
            self.coulorData.append(blueModel)
            self.coulorData.append(greenModel)
        }
    }
}
extension ColorTableViewViewModel: TableViewViewModel
{
    func viewDidAppear(_ animated: Bool) {
        if let view = view {
            view.setNavigationTitle(tableTitle)
        }
    }
    
    func setView(view: AnyObject?) {
        self.view = view as? ColorTableViewDelegate
    }
    
    func numberOfRows() -> Int {
        self.coulorData.count
    }
    
    func selectRow(onIndexPath indexpath: IndexPath) {
        self.selectedIndex = indexpath
    }
    
    func viewModel(forIndexPath indexpath: IndexPath) -> CellViewModel? {
        let row = indexpath.row
        if row < 0 || row > coulorData.count
        {
            return nil
        }
        let name = coulorData[row].name
        let vm = ColorTableViewCellViewModel(title: name)
        return vm
    }
    
    func selectedViewModel() -> ColorDetailViewModel? {
        guard let selectedindex = selectedIndex else {return nil}
        if selectedindex.row < 0 || selectedindex.row > coulorData.count
        {
            return nil
        }
        let model = coulorData[selectedindex.row]
        let vm = ColorDetailViewModel(view: nil, color: model)
        return vm
    }
    
    func model(forIndexPAth indexpath: IndexPath) -> AnyObject? {
       let row = indexpath.row
        if row < 0 || row > coulorData.count
        {
            return nil
        }
        let model = coulorData[row]
        return model
    }
    
    
}
