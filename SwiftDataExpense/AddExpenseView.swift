//
//  AddExpenseView.swift
//  SwiftDataExpense
//
//  Created by Pranjal Bikash Das on 23/03/25.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var expenseName: String = ""
    @State private var amount: Double = 0
    @State private var selectedDate: Date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Expense Name", text: $expenseName)
                TextField("Amount", value: $amount, format: .currency(code: "INR"))
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    } 
                }
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button("Save") {
                        let expense = Expense(date: selectedDate, value: amount, title: expenseName)
                        do {
                            try modelContext.insert(expense)
                        } catch {
                            print("Insert error", error)
                        }
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddExpenseView()
}
