//
//  ListRowView.swift
//  TodoList
//
//  Created by Abdallah on 26/12/2022.
//

import SwiftUI

struct ListRowView: View {
  
  let item:ItemModel
  
  var body: some View {
    HStack{
      Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
        .foregroundColor(item.isCompleted ? Color.green : .red)
      Text(item.title)
      Spacer()
    }
    .font(.title2)
    .padding(.vertical,8)
  }
}

struct ListRowView_Previews: PreviewProvider {
  
  static var items1 =   ItemModel(title: "ggg", isCompleted: false)
  static var items2 = ItemModel(title: "ff", isCompleted: true)
  
    static var previews: some View {
      Group{
        ListRowView(item: items1)
        ListRowView(item: items2)
      }.previewLayout(.sizeThatFits)
    }
}
