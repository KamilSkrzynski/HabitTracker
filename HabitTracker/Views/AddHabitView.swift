//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 13/05/2022.
//

import SwiftUI

struct AddHabitView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm = HabitsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter habit name", text: $vm.habitName)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter habit description", text: $vm.habitDescription)
                    .textFieldStyle(.roundedBorder)
                Button {
                    vm.createHabit()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Add")
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView()
    }
}
