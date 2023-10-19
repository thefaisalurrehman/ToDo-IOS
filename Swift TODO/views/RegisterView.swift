//
//  RegisterView.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewVm()
    var body: some View {
      
        HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
        
        Form{
            TextField("Full Name",text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            TextField("Email Address",text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            TextField("Password",text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            ToDoButton(title: "Create Account", background: .green){
                //click action
                viewModel.register()
            }.padding()
        }.offset(y:-50)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
