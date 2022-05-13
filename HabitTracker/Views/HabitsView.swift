//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 12/05/2022.
//

import SwiftUI

struct HabitsView: View {
    
    @StateObject private var vm = HabitsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(vm.habits, id: \.habitName) { habit in
                    HabitView(habit: habit)
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
