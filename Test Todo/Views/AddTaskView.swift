//
//  AddTaskView.swift
//  Test Todo
//
//  Created by codingway on 22/11/2023.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Create a new task")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter Task", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button {
                if title != "" {
                    realmManager.addTask(taskTitle: title)
                }
                dismiss()
            } label: {
                Text("Add Task")
                    .foregroundStyle(Color(.white))
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.328, saturation: 0.796, brightness: 0.420))
                    .clipShape(Capsule())
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

#Preview {
    AddTaskView()
        .environmentObject(RealmManager())
}
