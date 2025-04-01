//
//  ContentView.swift
//  SwiftDataExpense
//
//  Created by Pranjal Bikash Das on 23/03/25.
//

import SwiftUI
import SwiftData

struct ExpenseList: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \Expense.date) var expenses: [Expense]
    @State var showAddExpenseSheet: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(expenses){ expense in
                        HStack {
                            Text(expense.date, format: .dateTime.month(.abbreviated).day())
                            Text(expense.expenseText)
                            
                            Spacer()
                            
                            Text(expense.value, format: (.currency(code: "INR")))
                        }
                    }.onDelete { indexSet in
                        for index in indexSet {
                            modelContext.delete(expenses[index])
                        }
                    }
                }
                
                
            }
            .toolbar{
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        showAddExpenseSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView {
                        Label("No Expenses Found", systemImage: "list.bullet.rectangle.portrait")
                    } description: {
                        Text("Start adding expenses to see in you list")
                    } actions: {
                        Button {
                            showAddExpenseSheet = true
                        } label: {
                            Text("Add Expenses")
                        }
                    }
                }
            }
//            .padding()
            .navigationTitle("Expenses")
            .sheet(isPresented: $showAddExpenseSheet) {
                AddExpenseView()
            }
        }
        
    }
    
}

#Preview {
    ExpenseList()
}
