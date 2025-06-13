//
//  FoundationGenerable.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/13/25.
//

import SwiftUI
import FoundationModels

//struct FoundationGenerable: View {
//    
//    @State private var todos: [Todo] = []
//    @State private var isWriting: Bool = false
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(todos) { todo in
//                    Text(todo.task)
//                }
//            }
//            .navigationTitle("Todo")
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button("", systemImage: "apple.intelligence") {
//                        let prompt = "Create 10 todo list items!"
//                        
//                        Task {
//                            do {
//                                let session = LanguageModelSession()
//                                
//                                let response = session.streamResponse(generating: [Todo].self) {
//                                    prompt
//                                }
//                                
//                                isWriting = true
//                                for try await chunkTodos in response {
//                                    self.todos = chunkTodos.compactMap({
//                                        if let id = $0.id,
//                                           let task = $0.task {
//                                            return .init(id: id, task: task)
//                                        }
//                                        
//                                        return nil
//                                    })
//                                }
//                                
//                                isWriting = false
//                            } catch {
//                                isWriting = false
//                                print("### Foundation Generable - error: \(error.localizedDescription)")
//                            }
//                        }
//                    }
//                }
//            }
//            /*
//             MARK: 4. scrollEdgeEffectStyle()
//             
//             By default, List, Navigation, and other UI components now have a soft blur effect at the safe areas, also known as Progressive Blurs.
//             However, SwiftUI provieds a simple modifier to control these effects.
//             */
//            .scrollEdgeEffectStyle(.hard, for: .top)
//        }
//    }
//}
//
//#Preview {
//    FoundationGenerable()
//}
//
///*
// MARK: FoundationModels (@Generable)
// 
// FoundationModels include a macro called "@Generable" that enables the LanguageModelSession to generate data for the specified model.
// */
//@Generable
//struct Todo: Identifiable {
//    var id: String
//    /*
//     MARK: @Guide
//     This will provide the LanguageModel with context for filling in these properties.
//     Additionally, @Generable can also be provided with such descriptions!
//     */
//    @Guide(description: "")
//    var task: String
//}
