//
//  Expense.swift
//  SwiftDataExpense
//
//  Created by Pranjal Bikash Das on 23/03/25.
//

import Foundation
import SwiftData

@Model class Expense: Identifiable {
    var id: UUID
    var date: Date
    var value: Double
    var expenseText: String
    
    init(date: Date, value: Double, title: String) {
        self.id = UUID()
        self.date = date
        self.value = value
        self.expenseText = title
    }
}
