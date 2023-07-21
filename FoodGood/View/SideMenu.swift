//
//  SideMenu.swift
//  FoodGood
//
//  Created by София Буханевич on 13.07.23.
//

import SwiftUI

struct SideMenu: View {
    @Binding var selectedTab: String
    @Namespace var animation
    var body: some View {
        //Side Menu
        VStack(alignment: .leading, spacing: 15,content: {
            //IconFood
            VStack(alignment: .leading, spacing: 6,content: {
                Image("food")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.all)
                    .frame(width: 80,height: 80)
                    .background(Color.white)
                    .cornerRadius(15.0).padding(.top,35)
                Text("FoodGood").font(.title).fontWeight(.heavy).foregroundColor(.white)
            })
            VStack(alignment: .leading, spacing: 15){
                TabButton(image: "book.closed", title: "Поиск рецепта", selectedTab: $selectedTab, animation: animation)
                TabButton(image: "globe", title: "Рецепты разных стран", selectedTab: $selectedTab, animation: animation)
                TabButton(image: "highlighter", title: "Избраные рецепты", selectedTab: $selectedTab, animation: animation)
                TabButton(image: "archivebox", title: "Корзина продуктов", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading,-15)
            .padding(.top, 50)
            
        }).padding().frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
