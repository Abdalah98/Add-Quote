//
//  AddView.swift
//  TodoList
//
//  Created by Abdallah on 26/12/2022.
//

import SwiftUI

struct AddView: View {
  
  @State var text : String = ""
  @State var alertTitle : String = ""
  @State var showAlert : Bool = false

   var someColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
  
  @EnvironmentObject var  listViewModel: ListViewModel
 // @Environment(\.presentationMode) var presentationMode
  @Environment(\.dismiss) var dismiss

    var body: some View {
      ScrollView{
        
        VStack {
          TextField("type something here...",text: $text)
            .padding(.horizontal)
            .frame(height:55)
            .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
          .cornerRadius(10)
          Button {
            saveButtonPressed()
          } label: {
            Text("Save".uppercased())
              .foregroundColor(.white)
              .font(.headline)
              .frame(height: 55)
              .frame(maxWidth: .infinity)
              .background(Color.accentColor)
              .cornerRadius(10)
          }

        }
        .padding(14)
          
      }.navigationTitle("Add an Item 🖊️")
        .alert( isPresented: $showAlert) {
          getAlert()
        }
    }
  
  func saveButtonPressed(){
    if textIsAppropritate() {
      listViewModel.addItem(title: text)
     // presentationMode.wrappedValue.dismiss()
      dismiss()
    }
   
  }
  
  func textIsAppropritate()->Bool{
    if text.count < 3 {
      alertTitle = "Your to do item must be at least3 characters long !!!! 🫣"
      showAlert.toggle()
      return false
    }
    return true
  }
  
  func  getAlert() -> Alert {
    return Alert(title: Text(alertTitle))
  }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack{
        AddView()
      }.environmentObject(ListViewModel())
    }
}
