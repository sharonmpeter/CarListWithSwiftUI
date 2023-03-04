//
//  ContentView.swift
//  CodingInterview
//
//  Created by Sharon Peter on 14/02/23.
//

import SwiftUI
//import UIKit

struct ContentView: View {
    @StateObject private var viewModel = CarListViewModel()
    //For rating view
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.orange
    
    var body: some View {
        let carDataList = viewModel.lists
        
        List(0..<carDataList.count,id: \.self) { index in
            HStack(alignment: .top) {
                Image(carDataList[index].make)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 80)
                VStack(alignment: .leading) {
                    Text(carDataList[index].make)
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(.gray).padding(.top,4)
                    
                    Text("Price : \(formatPoints(num: carDataList[index].marketPrice))")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.gray).padding(.bottom,4)
                    // Spacer()
                    
                    HStack {
                        ForEach(1..<maximumRating + 1, id: \.self) { number in
                            image(for: number)
                                .foregroundColor(number > carDataList[index].rating ? offColor : onColor)
                        }
                    }
                    
                }
            }
            
            VStack(alignment: .leading) {
                if carDataList[index].prosList.count > 0 {
                    Text("Pros :")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(.gray).padding(.bottom,4)
                }
                
                if let pros = carDataList[index].prosList{
                    LazyVStack(alignment: .leading) {
                        ForEach(pros, id: \.self) { item in
                            HStack{
                                if item != "" {
                                    Text("\u{2022} ").font(.system(size: 36, weight: .bold)).foregroundColor(.orange)
                                    Text(item).font(.system(size: 17, weight: .semibold))
                                    
                                }
                                
                            }
                        }
                    }
                    
                }
                
                if let cons = carDataList[index].consList{
                    Text("Cons :")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(.gray)
                    LazyVStack(alignment: .leading) {
                        ForEach(cons, id: \.self) { item in
                            HStack{
                                if item != "" {
                                    Text("\u{2022} ").font(.system(size: 36, weight: .bold)).foregroundColor(.orange)
                                    Text(item).font(.system(size: 17, weight: .semibold))
                                }
                            }
                        }
                    }
                    
                }
            }
        }
        
        
    }
    func image(for number: Int) -> Image {
        if number > maximumRating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


