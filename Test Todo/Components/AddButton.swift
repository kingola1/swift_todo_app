//
//  AddButton.swift
//  Test Todo
//
//  Created by codingway on 22/11/2023.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundStyle(Color(.green))
            
            Text("+")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.heavy)
                .foregroundStyle(Color(.white))
        }
        .frame(height: 50)
    }
}

#Preview {
    AddButton()
}
