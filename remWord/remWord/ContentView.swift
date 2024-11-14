//
//  ContentView.swift
//  remWord
//
//  Created by Ray Lu on 10/28/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
//
//
//struct ContentView: View {
//    
//    //string variables:
//    private var message = "Hello, it's RemWord!"
//    private var start = "Tap me!"
//    private var addWords = "add words"
//    private var addToFile = "My File"
//    private var newFile = "New Files"
//    private var goBack = "Back"
//  
//    
//    
//    
//    //boolean variables:
//    @State private var isMessageVisi = true
//    @State private var isStart = true
//    @State private var isAddToFile = true
//    @State private var isNewFile = true
//    @State private var isGoBack = false
//    
//    
//    var body: some View {
//        VStack {
//            if isMessageVisi{
//                Text(message)
//                    .font(.largeTitle)
//                    .padding()
//            }
//            
//            Button(action: {isMessageVisi.toggle(); isStart.toggle()}){
//                if isStart{
//                    Text(start)
//                }
//            }
//            
//            if !isStart{
//                Button(action: {isAddToFile.toggle(); isNewFile.toggle()}){
//                    if isAddToFile{
//                        Text(addToFile)
//                    }
//                Button(action: {isNewFile.toggle(); isAddToFile.toggle()}){
//                    if isNewFile{
//                        Text(newFile)
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//


