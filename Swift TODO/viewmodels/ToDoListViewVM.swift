//
//  ToDoListViewVM.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//
import FirebaseFirestore
import Foundation

class ToDoListViewVM:ObservableObject{
    @Published var showingNewItemView = false
    private let userId:String
    init(userId:String){
        self.userId = userId
    }
    
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
