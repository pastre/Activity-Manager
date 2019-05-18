//
//  ActivityTableViewCell.swift
//  Activity Manager
//
//  Created by Bruno Pastre on 15/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell, ActivityDelegate {
    func onStateUpdated(activity: Activity) {
        // TODO
    }
    
    
    func onTimeUpdated(activity: Activity, newTime: String) {
//        print("Activity", activity)
        self.updateLabel(with: newTime)
    }
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var activity: Activity!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setActivity(activity: Activity){
        self.activity = activity
        self.activity.delegate = self
        self.titleLabel.text = activity.title
        self.subtitleLabel.text = activity.priority
    }
    
    func updateLabel(with time: String){
        self.subtitleLabel.text = "\(time) - \(self.activity.getSubtitle())"
    }
    

}
