//
//  Habit.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 13/05/2022.
//

import Foundation

struct Habit: Codable {
    
    var habitName: String
    var habitDescription: String
    var completionInfo: [HabitCompletion]
}

struct HabitCompletion: Codable {
    
    var completionDate: Date
}
