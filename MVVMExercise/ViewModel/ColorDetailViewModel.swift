//
//  ColorDetailViewModel.swift
//  MVVMExercise
//
//  Created by Bunny Bhargav on 27/05/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation


class ColorDetailViewModel: NSObject {
    fileprivate weak var view: ColorDetailViewDelegate?
    var model: Color
    init(view: ColorDetailViewDelegate?, color: Color) {
        self.model = color
        self.view = view
        super.init()
    }
}
extension ColorDetailViewModel: ViewModel
{
    func viewDidAppear(_ animated: Bool) {
        if let view = view
        {
            view.setNavigationTitle(model.name)
            view.assignBackgroundColor(red: model.red, green: model.green, blue: model.blue, alpha: model.alpha)
        }
    }
    
    func setView(view: AnyObject?) {
        self.view = view as? ColorDetailViewDelegate
    }
    
    
}
