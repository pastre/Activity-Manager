//
//  AssignmentTableViewCell.swift
//  Activity Manager
//
//  Created by Bruno Pastre on 16/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class AssignmentTableViewCell: UITableViewCell, ActivityDelegate {
    func onTimeUpdated(activity: Activity, newTime: String) {
        self.updateDescription(with: newTime)
//        print("Assignment", activity.self)
    }
    
    func onStateUpdated(activity: Activity) {
        self.updateButtonState()
    }
    

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var assignnment: Activity!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    func setAssignemnt(){
        self.assignnment.delegate = self
        self.titleLabel.text = self.assignnment.title
        self.subtitleLabel.text = self.assignnment.priority
        self.updateButtonState()
    }
    func updateDescription(with newTime: String){
        self.subtitleLabel.text = "\(newTime) - \(self.assignnment.priority!)"
    }
    
    func updateButtonState(){
        if self.assignnment.isPlaying(){
            self.assignnment._isPlaying = true
            let pause = UIImage(named: "pause")
            playButton.setImage(pause, for: .normal)
        }else{
            self.assignnment._isPlaying = false
            let pause = UIImage(named: "play")
            playButton.setImage(pause, for: .normal)
        }
    }
    
    @IBAction func onPlay(_ sender: Any) {
        self.assignnment.updatePlaying()
        
        self.updateButtonState()
    }
    
}
