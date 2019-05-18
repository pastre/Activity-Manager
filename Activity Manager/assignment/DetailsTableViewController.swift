//
//  DetailsTableViewController.swift
//  Activity Manager
//
//  Created by Bruno Pastre on 16/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController, ActivityDelegate {
    func onStateUpdated(activity: Activity) {
        // TODO: asd
    }
    
    
    func onTimeUpdated(activity: Activity, newTime: String) {
        print("Updated this shit", newTime)
//        self.tableView.alert
    }
    

    var activity: Activity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activity.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1 + activity.assignments.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.item
        if index == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "createCell", for: indexPath)
            return cell
        }
        // Configure the cell...
        let item = self.activity.assignments[index - 1]
        let cell = tableView.dequeueReusableCell(withIdentifier: "assignmentCell", for: indexPath) as! AssignmentTableViewCell
        cell.assignnment = item
        cell.setAssignemnt()
        return cell
    }
    

    @IBAction func onPlay(_ sender: Any) {
        print("Button is", sender)
//        let cell = sender as! AssignmentTableViewCell
        
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "addAssignment"{
            let dest = segue.destination as! AddAssignmentViewController
            dest.controller = self
            dest.activity = self.activity
        }
    }
    

}
