//
//  ActivityProvider.swift
//  Activity Manager
//
//  Created by Bruno Pastre on 15/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import Foundation



class ActivityProvider{
    static let instance = ActivityProvider()
    
    var activities: [Activity]
    // TODO:
//    {
//        didSet {
//            self.persistActivities()
//        }
//    }
    = {
        var activities: [Activity] = [Activity]()
    
        let titles = ["Lavar a louca", "Projeto do Crash Course", "Passar uma vassoura na casa"]
        let subtitles: [String] = ["easy", "fudeu", "hard"]

        for (i, title) in titles.enumerated(){
            let toAppend = Activity(title: title, priority: subtitles[i])
            activities.append(toAppend)
        }

        return activities
    }()
    
    func getActivityCount() -> Int{
        return self.activities.count
    }
    
    func addActivity(newActivity activity: Activity){
        self.activities.append(activity)
        print("Added", activity)
    }
    
    func addAssignment(assignment: Activity, to activity: Activity){
        for a in self.activities{
            if a.title == activity.title {
                assignment.parent = activity
                activity.assignments.append(assignment)
                return
            }
        }
    }
    
    func getActivity(at index: IndexPath) -> Activity{
        return self.activities[index.item]
    }
    
    func persistActivities(){   // TODO
//        UserDefaults.standard.set(activities, forKey: "activities")
    }
    
    private init(){
        // TODO:
//        self.activities = [Activity]()
//
//        if let data = UserDefaults.standard.array(forKey: "activities") as? Data{
//            do {
//                let dicts = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSArray
//
//                for dict in dicts{
//                    let toAppend = Activity(title: dict["title"], priority: dict["priority"])
//                    self.activities.append(toAppend)
//                }
//            } catch let error {
//                print("Failed to load ", data)
//            }
//
//
//        }
        
    }
}
