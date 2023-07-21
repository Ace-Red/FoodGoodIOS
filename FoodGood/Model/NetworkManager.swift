//
//  NetworkManager.swift
//  FoodGood
//
//  Created by София Буханевич on 15.07.23.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Receipt]()
    //"https://api.spoonacular.com/recipes/findByIngredients?apiKey=e4f4d19fc3e04ced9494557b8e023bc2&ingredients=apples,+flour,+sugar"
    func fetchData (str: String){
        if let url = URL(string: "https://api.spoonacular.com/recipes/findByIngredients?apiKey=40e43859f8a5482a9004ac12dc509c91&ingredients=\(str)"){
                   let session = URLSession(configuration: .default)
                   let task = session.dataTask(with: url) { data, response, error in
                       if error == nil{
                           let decoder = JSONDecoder()
                           if let safeData = data {
                               do{
                                   let results = try decoder.decode([Receipt].self, from: safeData)
                                   DispatchQueue.main.async {
                                       self.posts = results
                                   }
                               }
                               catch{
                                   print(error)
                               }
                           }
                       }
                   }
            task.resume()
        }
    }
}
