//
//  ColorDetailVCViewController.swift
//  MVVMExercise
//
//  Created by Bunny Bhargav on 29/05/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import UIKit

class ColorDetailVCViewController: UIViewController {
    var colordetailViewModel: ColorDetailViewModel?
    var colorCoordinator: ColorCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let vm = colordetailViewModel else {
            return
        }
        vm.viewDidAppear(animated)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ColorDetailVCViewController: ColorDetailViewDelegate
{
    func setNavigationTitle(_ title: String) {
        self.title = title
    }
    
    func assignBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
}
