//
//  PostReceiptData.swift
//  FoodGood
//
//  Created by София Буханевич on 15.07.23.
//

import Foundation
struct Results: Decodable{
    let receipt: [Receipt]
}

struct Receipt: Decodable, Identifiable{
    let id: Int
    let title: String
    let image: String
    let likes: Int
    
}
