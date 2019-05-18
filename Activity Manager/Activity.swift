//
//  Activity.swift
//  Activity Manager
//
//  Created by Bruno Pastre on 15/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import Foundation

protocol ActivityDelegate{
    
    func onTimeUpdated(activity: Activity, newTime: String)
    func onStateUpdated(activity: Activity)
}

class Activity{
    
    
    var title: String!
    var priority: String!
    var _isPlaying: Bool!
    var secondsPlaying: Int = 0
    var delegate: ActivityDelegate?
    var assignments: [Activity]!
    var parent: Activity?
    var currentAssignment: Activity?
    
    init(title: String?, priority: String?, assignments: [Activity]) {
        self.title = title
        self.priority = priority
        self.assignments = assignments
        self._isPlaying = false
    }
    
    
    init(title: String?, priority: String?) {
        self.title = title
        self.priority = priority
        self.assignments = [Activity]()
        self._isPlaying = false
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            if !self._isPlaying{ return }
            self.secondsPlaying += 1
            let asString = self.formatTime()
            self.delegate?.onTimeUpdated(activity: self, newTime: asString)
            
            if self.parent != nil{
                self.parent?.updateCurrentAssignment(with: self)
                self.parent?.secondsPlaying = self.secondsPlaying
                self.parent?.delegate?.onTimeUpdated(activity: self.parent!, newTime: asString)
            }
        }
    }
    
    func updatePlaying(){
        self._isPlaying = !self._isPlaying
        self.parent?.updateCurrentAssignment(with: self)
    }
    
    func updateCurrentAssignment(with assignment: Activity){
        for i in self.assignments{
            if i.title == assignment.title { continue }
            i.forceStop()
        }
        for i in self.assignments{
            
            i.delegate?.onStateUpdated(activity: i)
        }
        self.parent?.currentAssignment = assignment
    }
    
    func forceStop(){
        for i in self.assignments{
            i._isPlaying = false
            
        }
        
        self._isPlaying = false
        
        
    }
    
    func getSubtitle() -> String{
        
        return self.currentAssignment == nil ? self.priority : self.currentAssignment!.priority
    }
    
    
    func forcePlay(){
        if self.assignments.isEmpty{
            self._isPlaying = true
            return
        }
        print("assignments are")
        self.assignments.first!.updatePlaying()
        
    }
    
    func isPlaying() -> Bool{
        for i in self.assignments{
            if i._isPlaying { return true }
        }
        return self._isPlaying
    }

    func formatTime() -> String{
        let seconds = self.secondsPlaying % 60
        let minutes = self.secondsPlaying / 60
        return "\(minutes):\(seconds)"
    }
    
    func getRunningTime() -> String?{ // TODO: implementar essa funcao
        return "10:43"
    }
}
