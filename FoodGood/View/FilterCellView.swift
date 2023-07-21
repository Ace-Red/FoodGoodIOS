//
//  FilterCellView.swift
//  FoodGood
//
//  Created by София Буханевич on 17.07.23.
//

import SwiftUI
struct Filter: Identifiable, Equatable{
    let id = UUID()
    let name: String
    var isChoose: Bool
}
struct FilterCellView: View {
    @Binding var filter: Filter
    
    var body: some View {

                HStack{
                    Image(systemName: filter.isChoose ? "pencil.circle.fill" : "pencil.circle").onTapGesture {
                        filter.isChoose.toggle()
                        
                    }
                    Text(filter.name)
                }
            }
        }



