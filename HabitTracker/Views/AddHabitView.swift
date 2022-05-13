//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 13/05/2022.
//

import SwiftUI

struct AddHabitView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var habitName: String = ""
    @State var habitDescription: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter habit name", text: $habitName)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter habit description", text: $habitDescription)
                    .textFieldStyle(.roundedBorder)
                Button {
                    
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
