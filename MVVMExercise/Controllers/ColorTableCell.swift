//
//  ColorTableCell.swift
//  MVVMExercise
//
//  Created by Bunny Bhargav on 29/05/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation
import UIKit



class ColorTableCell: UITableViewCell
{
    var cellviewModel: CellViewModel?
    {
        willSet(newValue)
        {
        guard let vm = newValue
            else{
                self.textLabel?.text = ""
                return
            }
            self.textLabel?.text = vm.title
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
