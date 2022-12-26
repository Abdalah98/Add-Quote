//
//  ListView.swift
//  TodoList
//
//  Created by Abdallah on 26/12/2022.
//

import SwiftUI

struct ListView: View {
  @EnvironmentObject var  listViewModel: ListViewModel
    var body: some View {
      List{
        ForEach(listViewModel.items) { item in
          ListRowView(item: item)
            .onTapGesture {
              withAnimation(.linear){
                listViewModel.updateItem(item: item)
              }
            }
        }
        .onDelete(perform: listViewModel.deletItem)
        .onMove(perform: listViewModel.moveItem)
      }
      .listStyle(PlainListStyle())
      .navigationTitle("Todo List 📝")
      .navigationBarItems(
        leading: EditButton(),
        trailing: NavigationLink("Add", destination: AddView()))
    }
  
  
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack{
        ListView()
      }.environmentObject(ListViewModel())
    }
}

