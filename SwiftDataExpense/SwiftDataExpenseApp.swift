//
//  SwiftDataExpenseApp.swift
//  SwiftDataExpense
//
//  Created by Pranjal Bikash Das on 23/03/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExpenseApp: App {
    var configuration = ModelConfiguration()
    var container: ModelContainer {
        print("Document Directory", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!)
        return try! ModelContainer(for: Expense.self, configurations: configuration)
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            ExpenseList()
        }.modelContainer(container)
    }
}
