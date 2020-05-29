//
//  AppCordinators.swift
//  MVVMExercise
//
//  Created by Bunny Bhargav on 29/05/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordiantor {
    var childCoordinators = [Coordiantor]()
    var navigationController: UINavigationController
    
    init(navigationcontroller: UINavigationController) {
        self.navigationController = navigationcontroller
    }
    
    func start() {
        let vc = ColorListTableTableViewController()
        vc.mainCoordiantor = self
        navigationController.pushViewController(vc, animated: true)
    }
    func displayColor(withViewModel vm: ColorDetailViewModel)
    {
        let child = ColorCoordinator(navigationVc: self.navigationController)
        childCoordinators.append(child)
        child.viewmodel = vm
        child.start()
    }
    
}


