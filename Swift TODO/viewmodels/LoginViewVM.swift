//
//  LoginViewVM.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//

import Foundation
import FirebaseAuth

class LoginViewVM:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errotMsg = ""
    init(){}
    
    func login(){
        
        guard validate() else {
            return
        }
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate()->Bool{
        errotMsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errotMsg = "Please fill in all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errotMsg = "Please enter avalid email."
            return false
        }
        
        return true
    }
    
    
}
