//
//  HabitView.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 13/05/2022.
//

import SwiftUI

struct HabitView: View {
    
    let habit: Habit
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(habit.habitName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Text(habit.habitDescription)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Divider()
            Text(habit.completionInfo.count > 1 ? "\(habit.completionInfo.count) times done." : "\(habit.completionInfo.count) time done.")
                .font(.body)
                .foregroundColor(.gray)
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 10).stroke())
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        
        let habit = Habit(
            habitName: "Learn iOS Dev",
            habitDescription: "Habit to keep learning iOS development.",
            completionInfo: [
                HabitCompletion(
                    completionDate: Date()
                )
            ]
        )
        Group {
            HabitView(habit: habit)
                .preferredColorScheme(.light)
            
            HabitView(habit: habit)
                .preferredColorScheme(.dark)
        }
    }
}
