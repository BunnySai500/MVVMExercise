//
//  ColorModel.swift
//  MVVMExercise
//
//  Created by Bunny Bhargav on 23/05/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation
import UIKit


class Color
{
    private static let zero = CGFloat.zero
    private static let one = CGFloat(1.0)
    
    var name: String
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var alpha: CGFloat
    
    
    init?(colorname: String, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        if (red < Color.zero || red > Color.one)
        {
            return nil
        }
        if (green < Color.zero || green > Color.one)
        {
            return nil
        }
        if (blue < Color.zero || blue > Color.one)
        {
            return nil
        }
        if (alpha < Color.zero || alpha > Color.one)
        {
            return nil
        }
        
        self.name = colorname
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}
