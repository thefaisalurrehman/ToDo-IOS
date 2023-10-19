//
//  TodoListItemsView.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewmodel : ToDoListViewVM
    @FirestoreQuery var items:[ToDoListItem]
    init(userId:String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewmodel = StateObject(wrappedValue: ToDoListViewVM(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    List(items){item in
                       TodoItemsView(item: item)
                            .swipeActions{
                                Button("Delete"){
                                    viewmodel.delete(id: item.id)
                                }.tint(.red)
                            }
                    }
                    .listStyle(PlainListStyle())
                }
            }.navigationTitle("To do List")
                .toolbar {
                    Button{
                        //action
                        viewmodel.showingNewItemView = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewmodel.showingNewItemView, content: {
                    NewItemView(newItemPresented: $viewmodel.showingNewItemView)
                })
        }
    }
}


