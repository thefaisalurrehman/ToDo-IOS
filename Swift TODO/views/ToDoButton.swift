//
//  ToDoButton.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//

import SwiftUI

struct ToDoButton: View {
    let title:String
    let background:Color
    let action:()->Void
    var body: some View {
        Button{
            //
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        } .padding()
    }
}

#Preview {
    ToDoButton(title: "Log In", background:.blue){
        //action
    }
}
