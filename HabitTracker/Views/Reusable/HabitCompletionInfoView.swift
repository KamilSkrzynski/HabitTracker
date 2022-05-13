//
//  CompletionInfoView.swift
//  HabitTracker
//
//  Created by Kamil Skrzyński on 13/05/2022.
//

import SwiftUI

struct HabitCompletionInfoView: View {
    
    let habitCompletionInfo: HabitCompletion
    
    var body: some View {
        VStack(spacing: 5) {
            Text(habitCompletionInfo.completionDate.formatted(.dateTime.day().month().year()))
                 Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
            Text(habitCompletionInfo.completionDate.formatted(.dateTime.hour().minute()))
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("primaryColor")))
    }
}

struct HabitCompletionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        
        let habitCompletionInfo = HabitCompletion(
            completionDate: Date())
        
        HabitCompletionInfoView(habitCompletionInfo: habitCompletionInfo)
    }
}
