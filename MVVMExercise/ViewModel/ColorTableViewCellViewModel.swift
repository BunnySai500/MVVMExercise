//
//  ColorTableViewCellViewModel.swift
//  MVVMExercise
//
//  Created by Bunny Bhargav on 24/05/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation


class ColorTableViewCellViewModel: NSObject, CellViewModel {
    var title: String
    fileprivate weak var view: TableViewCellDelegate?
    
    init(title: String) {
        self.title = title
        super.init()
    }
    override init() {
        title = ""
        super.init()
    }
    func viewDidAppear(_ animated: Bool) {
        
    }
    func setView(view: AnyObject?) {
        if let cellview = view as? TableViewCellDelegate
        {
            self.view = cellview
        }
    }
    
    
}
