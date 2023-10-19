//
//  LoginView.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//

import SwiftUI

struct LoginView: View {
   @StateObject var viewModel = LoginViewVM()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done", 
                           angle: 15, background: .pink)
                
                Form{
                    if  !viewModel.errotMsg.isEmpty{
                        Text(viewModel.errotMsg)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address",text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password",text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    
                    ToDoButton(title: "Login", background: .blue){
                        //click action
                        viewModel.login()
                    }
                }.offset(y:-50)
                
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account",
                                   destination:RegisterView())
                }.padding(.bottom,50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
