//
//  TodoItemVM.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 19/10/2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodoItemVM :ObservableObject{
    
    init(){}
    
    func toggleIsDone(item:ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
