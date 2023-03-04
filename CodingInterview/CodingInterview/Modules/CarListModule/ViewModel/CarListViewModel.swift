//
//  CarListViewModel.swift
//  CodingInterview
//
//  Created by Sharon Peter on 14/02/23.
//

import Foundation
//import SwiftUI
import Combine

extension ContentView{
    @MainActor class CarListViewModel: ObservableObject {
        var lists = DataManager.shared.loadData(car: "car_list")
    }
    
    func formatPoints(num: Int) ->String{
        let thousandNum = num/1000
        let millionNum = num/1000000
        if num >= 1000 && num < 1000000{
            if(thousandNum == thousandNum){
                return("\(thousandNum)k")
            }
            return("\(thousandNum)k")
        }
        if num > 1000000{
            if(millionNum == millionNum){
                return("\(millionNum)M")
            }
            return ("\(millionNum)M")
        }
        else{
            if(num == num){
                return ("\(num)")
            }
            return ("\(num)")
        }
    }
}

