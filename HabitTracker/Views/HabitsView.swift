//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 12/05/2022.
//

import SwiftUI

struct HabitsView: View {
    
    @ObservedObject var vm = HabitsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<vm.habits.count, id: \.self) { habitIndex in
                    NavigationLink {
                        HabitDetailView(vm: self.vm, index: habitIndex)
                    } label: {
                        HabitView(habit: vm.habits[habitIndex])
                    }
                }
            }
            .padding()
            .navigationTitle("Habits")
            .toolbar {
                Button {
                    vm.addNewHabit.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $vm.addNewHabit) {
                AddHabitView()
            }
        }
    }
}

struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
