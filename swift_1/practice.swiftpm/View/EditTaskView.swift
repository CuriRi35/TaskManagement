import SwiftUI

struct EditTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State var task: TodoItem
    @Binding var todos: [TodoItem]

    var body: some View {
        NavigationView {
            Form {
                TextField("タスク名を入力", text: $task.title)
                DatePicker("期限", selection: $task.date, displayedComponents: .date)
            }
            .navigationTitle("タスクを編集")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("キャンセル") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("保存") {
                        if let index = todos.firstIndex(where: { $0.id == task.id }) {
                            todos[index] = task // タスクを更新
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}
