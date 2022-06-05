//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 13/05/2022.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("primaryColor")))
    }
}

struct AddHabitView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var vm = HabitsViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                TextField("Enter habit name", text: $vm.habitName)
                    .textFieldStyle(CustomTextFieldStyle())
                
                TextField("Enter habit description", text: $vm.habitDescription)
                    .textFieldStyle(CustomTextFieldStyle())
                    
                Button {
                    vm.createHabit()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                        .font(.title3)
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
        Group {
            AddHabitView()
                .preferredColorScheme(.light)
            AddHabitView()
                .preferredColorScheme(.dark)
        }
    }
}
