//
//  ListViewModel.swift
//  TodoList
//
//  Created by Abdallah on 26/12/2022.
//

import Foundation
class ListViewModel : ObservableObject{
  
   @Published var items = [ItemModel]()
  
  init(){
    getItem()
  }
  
  func getItem(){
    let item = [
      ItemModel(title: "ggg", isCompleted: false),
      ItemModel(title: "ff", isCompleted: true),
      ItemModel(title: "ss", isCompleted: false),
      ItemModel(title: "ff", isCompleted: true)]
      items.append(contentsOf: item)
  }
  
  func deletItem(index:IndexSet){
    items.remove(atOffsets: index)
  }
  
  func moveItem(from: IndexSet,to:  Int){
    items.move(fromOffsets: from, toOffset: to)
  }
  
  func addItem(title:String){
    let newItem = ItemModel(title: title, isCompleted: false)
    items.append( newItem)
  }
  
  func updateItem(item :ItemModel){
    if let index = items.firstIndex(where: {$0.id == item.id}){
      items[index] = item.updateCompletion()
    }
  }
}
