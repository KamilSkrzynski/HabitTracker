//
//  HabitsViewModel.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 13/05/2022.
//

import Foundation

final class HabitsViewModel: ObservableObject {
    
    @Published var habits = [Habit]()
    @Published var addNewHabit: Bool = false
}
