import SwiftUI
import Foundation

// Todoアイテムの構造体

// メイン画面
struct ContentView: View {
    @State private var todos: [TodoItem] = []  // Todoアイテムのリスト
    @State private var showAddTaskView = false  // タスク追加画面の表示状態
    
    var body: some View {
        NavigationView {
            VStack {
                if todos.isEmpty {
                    Text("タスクがまだありません")
                        .font(.headline)
                        .padding()
                } else {
                    // タスクを日付順にソートして表示、削除機能追加
                    List {
                        ForEach(todos.sorted(by: { $0.date < $1.date })) { todo in
                            VStack(alignment: .leading) {
                                Text(todo.title)
                                    .font(.headline)
                                Text("期限: \(formattedDate(todo.date))")  // 日付を表示
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onDelete(perform: deleteTask)  // 削除機能
                    }
                }
            }
            .navigationTitle("Todoリスト")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddTaskView = true  // プラスボタンを押したら追加画面へ遷移
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(todos: $todos)  // タスク追加画面をモーダルで表示
            }
        }
    }
    
    // 日付をフォーマットする関数
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
    
    // タスクを削除する関数
    func deleteTask(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

