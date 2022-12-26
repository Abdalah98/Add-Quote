//
//  TodoListApp.swift
//  TodoList
//
//  Created by Abdallah on 26/12/2022.
//

import SwiftUI

@main
struct TodoListApp: App {
  
  @StateObject var listViewModel = ListViewModel()
  
    var body: some Scene {
      WindowGroup {
        NavigationStack{
          ListView()
        }
        .environmentObject(listViewModel)
      }
    }
}
