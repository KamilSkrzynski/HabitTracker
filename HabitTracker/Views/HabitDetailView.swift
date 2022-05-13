//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 13/05/2022.
//

import SwiftUI

struct HabitDetailView: View {
    
    @ObservedObject var vm: HabitsViewModel
    var index: Int
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(self.vm.habits[index].habitDescription)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Divider()
                Text(self.vm.habits[index].completionInfo.count > 1 ? "\(self.vm.habits[index].completionInfo.count) times done." : "\(self.vm.habits[index].completionInfo.count) time done.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Spacer()
                    .frame(height: 20)
                Text("COMPLETION DATES")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.vm.habits[index].completionInfo, id: \.completionDate) { completionInfo in
                        HabitCompletionInfoView(habitCompletionInfo: completionInfo)
                    }
                }
            }
        }
        .padding()
        .navigationTitle(self.vm.habits[index].habitName)
        .toolbar {
            Button {
                let completion = HabitCompletion(completionDate: Date())
                self.vm.habits[index].completionInfo.append(completion)
            } label: {
                Text("Mark as completed")
            }
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let index = 0
        let vm = HabitsViewModel()

        Group {
            NavigationView {
                HabitDetailView(vm: vm, index: index)
                    .preferredColorScheme(.light)
            }
            NavigationView {
                HabitDetailView(vm: vm, index: index)
                    .preferredColorScheme(.dark)
            }
        }
        
    }
}
