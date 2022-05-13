//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 13/05/2022.
//

import SwiftUI

struct HabitDetailView: View {
    
    let habit: Habit
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(habit.habitDescription)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Divider()
                Text(habit.completionInfo.count > 1 ? "\(habit.completionInfo.count) times done." : "\(habit.completionInfo.count) time done.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Text("COMPLETION DATES")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(habit.completionInfo, id: \.completionDate) { completionInfo in
                        HabitCompletionInfoView(habitCompletionInfo: completionInfo)
                    }
                }
            }
        }
        .padding()
        .navigationTitle(habit.habitName)
        .toolbar {
            Button {
                
            } label: {
                Text("Mark as completed")
            }
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let habit = Habit(
            habitName: "Learn iOS Dev",
            habitDescription: "Habit to keep learning iOS development.",
            completionInfo: [
                HabitCompletion(
                    completionDate: Date()
                ),
                HabitCompletion(
                    completionDate: Date()
                ),
                HabitCompletion(
                    completionDate: Date()
                ),
                HabitCompletion(
                    completionDate: Date()
                )
            ]
        )
        Group {
            NavigationView {
                HabitDetailView(habit: habit)
                    .preferredColorScheme(.light)
            }
            NavigationView {
                HabitDetailView(habit: habit)
                    .preferredColorScheme(.dark)
            }
        }
        
    }
}
