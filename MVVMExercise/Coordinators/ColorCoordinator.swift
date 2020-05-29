//
//  ColorCoordinator.swift
//  MVVMExercise
//
//  Created by Bunny Bhargav on 29/05/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation
import UIKit


class ColorCoordinator: Coordiantor
{
    var childCoordinators = [Coordiantor]()
    
    var navigationController: UINavigationController
    
    var viewmodel: ColorDetailViewModel?
    
    init(navigationVc: UINavigationController) {
        self.navigationController = navigationVc
    }
    
    func start() {
        let vc = ColorDetailVCViewController()
        vc.modalPresentationStyle = .fullScreen
        viewmodel?.setView(view: vc)
        vc.colordetailViewModel = viewmodel
        navigationController.pushViewController(vc, animated: false)
    }
    
}
