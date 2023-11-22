//
//  TaskRow.swift
//  Test Todo
//
//  Created by codingway on 22/11/2023.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: completed ? "checkmark.circle" : "circle")
            Text(task)
        }
    }
}

#Preview {
    TaskRow(task: "Complete Swift Todo App", completed: true)
}
