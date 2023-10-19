//
//  TodoItemsView.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//

import SwiftUI

struct TodoItemsView: View {
    @StateObject var viewmodel = TodoItemVM()
    let item:ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button(action: {
                viewmodel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            })
        }
        
    }
}


