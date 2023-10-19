//
//  NewItemView.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewmodel = NewItemViewVM()
    @Binding var newItemPresented:Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,100)
            Form{
                TextField("Title", text: $viewmodel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date",selection: $viewmodel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                ToDoButton(title: "Save", background: Color.pink){
                    if viewmodel.canSave{
                        viewmodel.save()
                        newItemPresented = false
                    }else{
                        viewmodel.showAlert = true
                    }
                   
                }.padding()
            }.alert(isPresented: $viewmodel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
    }
}


