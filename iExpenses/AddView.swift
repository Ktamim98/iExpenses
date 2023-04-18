//
//  AddView.swift
//  iExpenses
//
//  Created by Tamim Khan on 19/4/23.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "personal"
    @State private var amount = 0.0
    
    let types = ["Business", "personal"]
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dissmiss
    

    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expenses")
            
            .toolbar{
                Button("save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dissmiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
