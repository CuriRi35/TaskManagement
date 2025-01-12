//
//  File.swift
//  
//
//  Created by 並木　彗 on 2024/10/20.
//

import SwiftUI


struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss  // この変数で画面を閉じる
    @State private var newTaskTitle = ""  // 新しいタスクのタイトル
    @State private var newTaskDate = Date()  // 新しいタスクの日付
    @Binding var todos: [TodoItem]  // メイン画面のTodoリストへのバインディング
    
    var body: some View {
        NavigationView {
            Form {
                TextField("タスク名を入力", text: $newTaskTitle)
                DatePicker("期限", selection: $newTaskDate, displayedComponents: .date)  // 日付選択用
            }
            .navigationTitle("新しいタスクを追加")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("キャンセル") {
                        dismiss()  // キャンセルボタンで画面を閉じる
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("保存") {
                        if !newTaskTitle.isEmpty {
                            let newTodo = TodoItem(title: newTaskTitle, date: newTaskDate)
                            todos.append(newTodo)  // 新しいタスクをリストに追加
                            dismiss()  // 追加後に画面を閉じる
                        }
                    }
                }
            }
        }
    }
}
