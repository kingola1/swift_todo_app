//
//  ContentView.swift
//  Test Todo
//
//  Created by codingway on 22/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var realmManager = RealmManager()
    @State private var showAddTask = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TaskView()
                .environmentObject(realmManager)
            
            AddButton()
                .padding()
                .onTapGesture(perform: {
                    showAddTask.toggle()
                })
        }
        .sheet(isPresented: $showAddTask, content: {
            AddTaskView()
                .environmentObject(realmManager)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
//    edgesIgnoringSafeArea(.all)
}

#Preview {
    ContentView()
}
