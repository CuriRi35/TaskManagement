//
//  File.swift
//
//
//  Created by 並木　彗 on 2024/10/20.


import SwiftUI

struct EditTaskView: View {
    @Binding var todos: [TodoItem]  // Todoアイテムのリスト
    var index: Int  // 編集するタスクのインデックス
    @State private var title: String
    @State private var date: Date
    
    // 初期化
    init(todos: Binding<[TodoItem]>, index: Int) {
        self._todos = todos
        self.index = index
        self._title = State(initialValue: todos.wrappedValue[index].title)
        self._date = State(initialValue: todos.wrappedValue[index].date)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("タスク名")) {
                    TextField("タスク名を入力", text: $title)
                }
                
                Section(header: Text("期限")) {
                    DatePicker("期限", selection: $date, displayedComponents: .date)
                }
                
                Section {
                    Button(action: {
                        // タスクを更新する
                        todos[index].title = title
                        todos[index].date = date
                    }) {
                        Text("タスクを更新")
                    }
                }
            }
            .navigationTitle("タスクを編集")
            .navigationBarItems(trailing: Button("完了") {
                // 編集完了ボタン
            })
        }
    }
}
