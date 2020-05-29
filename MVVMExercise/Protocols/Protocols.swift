//
//  Protocols.swift
//  MVVMExercise
//
//  Created by Bunny Bhargav on 23/05/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModel {
    func viewDidAppear(_ animated: Bool)
    func setView(view: AnyObject?) -> Void
}
protocol CellViewModel: ViewModel{
    var title: String {get set}
}
protocol TableViewViewModel: ViewModel{
    var tableTitle: String{get set}
    func numberOfRows() -> Int
    func selectRow(onIndexPath indexpath: IndexPath)
    func viewModel(forIndexPath indexpath: IndexPath) -> CellViewModel?
    func selectedViewModel() -> ColorDetailViewModel?
    func model(forIndexPAth indexpath: IndexPath) -> AnyObject?
}
protocol ColorTableViewDelegate: class {
    func setNavigationTitle(_ title:String) -> Void
}
protocol TableViewCellDelegate: class {
    var title: String {get set}
}
protocol ColorDetailViewDelegate: class {
    func setNavigationTitle(_ title:String) -> Void
    func assignBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Void
}


protocol Coordiantor
{
    var childCoordinators: [Coordiantor] {get set}
    var navigationController: UINavigationController {get set}
    func start()
}
