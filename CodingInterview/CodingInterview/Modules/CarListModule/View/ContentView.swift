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
        
        NavigationStack {
            
            List(viewModel.lists) { car in
                HStack(alignment: .top) {
                    Image(car.make)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 80)
                    VStack(alignment: .leading) {
                        Text(car.make)
                            .font(.system(size: 23, weight: .bold))
                            .foregroundColor(.gray).padding(.top,4)
                        
                        Text("Price : \(formatPoints(num: car.marketPrice))")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.gray).padding(.bottom,4)
                        // Spacer()
                        
                        HStack {
                            ForEach(1..<maximumRating + 1, id: \.self) { number in
                                image(for: number)
                                    .foregroundColor(number > car.rating ? offColor : onColor)
                            }
                        }
                        
                    }
                }
                
                VStack(alignment: .leading) {
                    if car.prosList?.count ?? 0 > 0 {
                        Text("Pros :")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundColor(.gray).padding(.bottom,4)
                    }
                    if let pros = car.prosList, !pros.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Pros:")
                                .font(.system(size: 23, weight: .bold))
                                .foregroundColor(.gray)
                                .padding(.bottom, 4)
                            
                            LazyVStack(alignment: .leading) {
                                ForEach(Array(pros.enumerated()), id: \.offset) { index, item in
                                    if !item.isEmpty {
                                        HStack {
                                            Text("\u{2022} ")
                                                .font(.system(size: 36, weight: .bold))
                                                .foregroundColor(.orange)
                                            Text(item)
                                                .font(.system(size: 17, weight: .semibold))
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                    
                    if let cons = car.consList, !cons.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Cons:")
                                .font(.system(size: 23, weight: .bold))
                                .foregroundColor(.gray)
                            
                            LazyVStack(alignment: .leading) {
                                ForEach(Array(cons.enumerated()), id: \.offset) { index, item in
                                    if !item.isEmpty {
                                        HStack {
                                            Text("\u{2022} ")
                                                .font(.system(size: 36, weight: .bold))
                                                .foregroundColor(.orange)
                                            Text(item)
                                                .font(.system(size: 17, weight: .semibold))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            .navigationTitle("Cars Lists")
            .navigationBarTitleDisplayMode(.inline)
            
            
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


