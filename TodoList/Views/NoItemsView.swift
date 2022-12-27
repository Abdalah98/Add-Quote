//
//  NoItemsView.swift
//  TodoList
//
//  Created by Abdallah on 27/12/2022.
//

import SwiftUI

struct NoItemsView: View {
  
  @State var animate:Bool = false
  let secondryAccentColor = Color("SecondryAccentColor")
    var body: some View {
      ScrollView{
        VStack(spacing: 40){
          Text("There are no items!")
            .font(.title)
            .fontWeight(.semibold)
          Text("Are you a productive person? I think you should click the add button and add a of items to your todo list!")
            .padding(.bottom, 20)
          NavigationLink {
            AddView()
          } label: {
            Text("Add Something 🤩 ")
              .foregroundColor(.white)
              .font(.headline)
              .frame(height:55)
              .frame(maxWidth: .infinity)
              .background(animate ? secondryAccentColor :  Color.accentColor)
              .cornerRadius(16)
          }
          .padding(.horizontal, animate ? 30 : 50)
          .shadow(
            color: animate ? secondryAccentColor.opacity(0.7) :  Color.accentColor.opacity(0.7)
            , radius: animate ? 30 : 10
              ,x: 0
            ,y: animate ? 50 :30)
          .scaleEffect(animate ? 1.1 : 1.0)
          .offset(y:animate ? -7 : 0)

        }
        .frame(maxWidth: 400)
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
      }
    }
  
  func addAnimation(){
    guard  !animate else{return}
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
      withAnimation(
        Animation.easeInOut(duration: 2.0)
          .repeatForever()
      ){
        animate.toggle()
      }
    }
  }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack{
        NoItemsView()
      }
    }
}
