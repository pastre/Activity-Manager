//
//  ActivityTableViewController.swift
//  Activity Manager
//
//  Created by Bruno Pastre on 15/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class ActivityTableViewController: UITableViewController {

    

    let provider: ActivityProvider = ActivityProvider.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.onAdd))
        self.navigationItem.rightBarButtonItem = addButton
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("apareci brabo ")
        self.tableView.reloadData()
//        self.reloadDelegates()
    }
    
    @objc func onAdd(_ sender: Any?){
        self.performSegue(withIdentifier: "addActivity", sender: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.provider.getActivityCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityTableViewCell
//        let activity =
        
        cell.setActivity(activity: self.provider.getActivity(at: indexPath))

        return cell
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // TODO: Implementar aqui o lance de puxar a celula pro lado
        
        let activity = self.provider.activities[indexPath.item]
        let action = UIContextualAction(style: .normal, title: "Start") { (action, view, done) in
            print("ASDAD", action, view)
            if activity.isPlaying(){
                activity.forceStop()
            }else{
                activity.forcePlay()
            }
//            self.playActivity(activity: activity)
            self.tableView.reloadData()
            done(true)
        }
        let icon = activity.isPlaying() ? UIImage(named: "pause") : UIImage(named: "play")
//        icon.color
        action.image = icon
        action.title = "Start"
        action.backgroundColor = activity.isPlaying() ? #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1) :  #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        let config = UISwipeActionsConfiguration(actions: [action] )
//        config.
        return config
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return nil
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
//        print("Any is", sender)
        if segue.identifier == "addActivity"{
            let dest = segue.destination as! AddActivityViewController
            dest.controller = self
        }else if segue.identifier == "detailActivity"{
            let activityCell = sender as! ActivityTableViewCell
            let dest = segue.destination as! DetailsTableViewController
            dest.activity = activityCell.activity
//            dest.activity = self
            
        }
        
    }
    

}
