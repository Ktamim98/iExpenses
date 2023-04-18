//
//  ExpenseItem.swift
//  iExpenses
//
//  Created by Tamim Khan on 18/4/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
