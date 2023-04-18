//
//  ContentView.swift
//  iExpenses
//
//  Created by Tamim Khan on 18/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpenses = false
    
       
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items, id: \.id) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                            .font(expenseAmountFont(for: item.amount))
                            .foregroundColor(expenseAmountColor(for: item.amount))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpenses")
            .toolbar{
                Button{
                   showingAddExpenses = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpenses){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    
    
    func expenseAmountFont(for amount: Double) -> Font {
            if amount < 10 {
                return .caption
            } else if amount < 100 {
                return .subheadline
            } else {
                return .headline
            }
        }
        
        
        func expenseAmountColor(for amount: Double) -> Color {
            if amount < 10 {
                return .green
            } else if amount < 100 {
                return .blue
            } else {
                return .red
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
