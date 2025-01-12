//
//  TodoItem.swift
//  practice
//
//  Created by 並木　彗 on 2024/10/20.
//

import Foundation

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var date: Date  // タスクの期限日
}
