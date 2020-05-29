//
//  ColorListTableTableViewController.swift
//  MVVMExercise
//
//  Created by Bunny Bhargav on 27/05/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import UIKit

class ColorListTableTableViewController: UITableViewController {

    var colorlistViewModel: ColorTableViewViewModel?
    var mainCoordiantor: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
    registerCells()
    colorlistViewModel = ColorTableViewViewModel(title: "Select a color", view: self)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = .white
        colorlistViewModel?.viewDidAppear(animated)
    }
    func registerCells()
    {
        self.tableView.register(ColorTableCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let vm = colorlistViewModel else { return 0}
        return vm.coulorData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? ColorTableCell else {return UITableViewCell()}
        guard let vm = colorlistViewModel else { return UITableViewCell()}
        let cellVM = vm.viewModel(forIndexPath: indexPath) 
        cell.cellviewModel = cellVM
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vm = colorlistViewModel else {
            return
        }
        vm.selectRow(onIndexPath: indexPath)
        showSelectedColor()
    }
    func showSelectedColor()
    {
        guard let vm = colorlistViewModel, let model = vm.selectedViewModel() else {
                   return
        }
        mainCoordiantor?.displayColor(withViewModel: model)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ColorListTableTableViewController:  ColorTableViewDelegate
{
    func setNavigationTitle(_ title: String) -> Void {
        self.title = title
    }
}
