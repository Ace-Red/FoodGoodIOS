//
//  SearchWindow.swift
//  FoodGood
//
//  Created by София Буханевич on 13.07.23.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab: String
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection: $selectedTab){
            SearchReceipts()
                .tag("Поиск рецепта")
            ReceiptsFromDifContry()
                .tag("Рецепты разных стран")
            MarkReceipts()
                .tag("Избраные рецепты")
            BasketFood()
                .tag("Корзина продуктов")
            
        }
    
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct SearchReceipts: View{
    @ObservedObject var networkManager = NetworkManager()
    @State public var filters = [Filter(name: "apple", isChoose: false), Filter(name: "sugar", isChoose: false), Filter(name: "chicken", isChoose: false)]
    @State var arrStrToApi:[String] = []
    var body: some View{
    NavigationView{
        VStack{
           
                List($filters){ $filter in
                    
                    FilterCellView(filter: $filter).onChange(of: filter) { newValue in
                        if(newValue.isChoose == true){
                            arrStrToApi.append(newValue.name)
                            print(arrStrToApi)
                        } else{
                            for i in 0...arrStrToApi.count - 1{
                                print(arrStrToApi)
                                if(arrStrToApi[i] == newValue.name){
                                    arrStrToApi.remove(at: i)
                                }
                            }
                        }
                        var strApi: String = ""
                        if !arrStrToApi.isEmpty{
                            for i in 0...arrStrToApi.count - 1{
                                if (i == 0){
                                    strApi += arrStrToApi[i]
                                }
                                else{
                                    strApi += (",+" + arrStrToApi[i])
                                }
                            }
                        }
                        self.networkManager.fetchData(str: strApi)
                    }
                    
                }.frame(height: 150)
                List(networkManager.posts){ post in
                    Image("recipe").resizable().aspectRatio(contentMode: .fill).frame(height: 310)
                    HStack(spacing: 8) {
                        
                        Text(post.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer(minLength: 0)
                        
                    }
                }
        }.navigationTitle("Поиск рецепта")
    }
    
}
}

struct ReceiptsFromDifContry: View{
    var body: some View{
        NavigationView{
            Text("Рецепты разных стран")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary).navigationTitle("Рецепты разных стран")
        }
    }
}



struct MarkReceipts: View{
    var body: some View{
        NavigationView{
            Text("Избраные рецепты")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary).navigationTitle("Избраные рецепты")
        }
    }
}

struct BasketFood: View{
    var body: some View{
        NavigationView{
            Text("Корзина продуктов")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary).navigationTitle("Корзина продуктов")
        }
    }
}
