//
//  ListViewModel.swift
//  TodoList
//
//  Created by Abdallah on 26/12/2022.
//

import Foundation
class ListViewModel : ObservableObject{
  
  @Published var items = [ItemModel](){
    didSet{
      saveItems()
    }
  }
  
  let itemsKey = "save"
  
  init(){
    getItem()
  }
  
  func getItem(){
 
      guard
        let data = UserDefaults.standard.data(forKey: itemsKey),
        let saveItem = try? JSONDecoder().decode([ItemModel].self, from: data)
          else{return}
    self.items = saveItem
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
  
  func saveItems(){
    if let encodedData = try? JSONEncoder().encode(items){
      UserDefaults.standard.set(encodedData, forKey: itemsKey)
    }
  }
}
