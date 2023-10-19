//
//  MainViewVM.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//
import FirebaseAuth
import Foundation

class MainViewVM:ObservableObject{
    
    @Published var currentUserId:String=""
    private var handler:AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener {[weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
            
        }
    }
    
    public var isSignedIn:Bool{
        return Auth.auth().currentUser != nil
    }
    
}
