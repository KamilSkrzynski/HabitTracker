//
//  HabitsViewModel.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 13/05/2022.
//

import Foundation

final class HabitsViewModel: ObservableObject {
    
    @Published var habits: [Habit] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(habits) {
                UserDefaults.standard.setValue(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let habits = UserDefaults.standard.data(forKey: "Habits") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Habit].self, from: habits) {
                self.habits = decoded
                return
            }
        }
        self.habits = []
    }
    
    @Published var addNewHabit: Bool = false
    
    @Published var habitName: String = ""
    @Published var habitDescription: String = ""
    
    func createHabit() {
        let habit = Habit(
            habitName: habitName,
            habitDescription: habitDescription,
            completionInfo: [])
        self.habits.append(habit)
    }
}
