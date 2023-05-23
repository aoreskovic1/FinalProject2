

import SwiftUI

struct ToDoo: View {
    
//    @State var todoItems: [ToDoItem] = []
    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.priorityNum, ascending: false)])
    var todoItems: FetchedResults<ToDoItem>
    @Environment(\.managedObjectContext) var context
    
    @State private var newItemName: String = ""
    @State private var newItemPriority: Priority = .normal
    
    @State private var showNewTask = false
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    Text("Add new lyrics")
                        .font(.system(size: 40, weight: .black, design: .rounded))
                        
                    Spacer()
                    
                    Button(action: {
                        self.showNewTask = true
                        
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                    }
                }
                .padding()
                
                List {
                    
                    ForEach(todoItems) { todoItem in
                        ToDoListRow(todoItem: todoItem)
                    }.onDelete(perform: deleteTask)
                }
            }
            .rotation3DEffect(Angle(degrees: showNewTask ? 5 : 0), axis: (x: 1, y: 0, z: 0))
            .offset(y: showNewTask ? -50 : 0)
            .animation(.easeOut, value: showNewTask)
            
            // If there is no data, show an empty view
            if todoItems.count == 0 {
                NoDataView()
            }
            
            // Display the "Add new todo" view
            if showNewTask {
                BlankView(bgColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showNewTask = false
                    }
                
                NewToDoView(isShow: $showNewTask, name: "", name2: "", priority: .normal)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0), value: showNewTask)
            }
        }
    }
    
    private func deleteTask(indexSet: IndexSet) {
        for index in indexSet {
            let itemToDelete = todoItems[index]
            context.delete(itemToDelete)
            DispatchQueue.main.async {
                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
    }

}

struct ToDoo_Previews: PreviewProvider {
    static var previews: some View {
        ToDoo()
    }
}

struct BlankView : View {

    var bgColor: Color

    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct NoDataView: View {
    var body: some View {
        Image("nodata")
            .resizable()
            .scaledToFit()
    }
}

struct ToDoListRow: View {
    
    @ObservedObject var todoItem: ToDoItem
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        
            HStack {
                
                Text(self.todoItem.name)
                    .strikethrough(self.todoItem.isComplete, color: .black)
                    .bold()
                    .animation(.default)
        
        }
    }
    }

