import SwiftUI

struct ContentView: View {
    @State private var todos: [TodoItem] = [] // Todoアイテムのリスト
    @State private var showAddTaskView = false // タスク追加画面の表示状態
    @State private var showEditTaskView = false // タスク編集画面の表示状態
    @State private var editingTask: TodoItem? // 編集対象のタスク
    @State private var isEditingMode = false // 編集モードの状態

    var body: some View {
        NavigationView {
            VStack {
                if todos.isEmpty {
                    Text("タスクがまだありません")
                        .font(.headline)
                        .padding()
                } else {
                    List {
                        ForEach(todos.sorted(by: { $0.date < $1.date })) { todo in
                            VStack(alignment: .leading) {
                                Text(todo.title)
                                    .font(.headline)
                                Text("期限: \(formattedDate(todo.date))")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .onTapGesture {
                                if isEditingMode {
                                    editingTask = todo // 編集対象を設定
                                    showEditTaskView = true // 編集画面を表示
                                }
                            }
                        }
                        .onDelete(perform: deleteTask)
                    }
                }
            }
            .navigationTitle("Todoリスト")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(isEditingMode ? "完了" : "編集") {
                        isEditingMode.toggle()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddTaskView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(todos: $todos)
            }
            .sheet(item: $editingTask) { task in
                EditTaskView(task: task, todos: $todos)
            }
        }
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }

    func deleteTask(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}
