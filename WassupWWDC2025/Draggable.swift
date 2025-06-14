//
//  Draggable.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/14/25.
//

import SwiftUI

/*
 MARK: 12. draggable(containerItemID) & dragContainer()
 
 SwiftUI now supports multiple items to drag and drop them from one location to another!
 */
struct Draggable: View {
    
    @State private var selectedIDs: [String] = []
    
    var body: some View {
        VStack(spacing: 20) {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 15) {
                ForEach(colorItems) { item in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(item.color.gradient)
                        .frame(width: 80, height: 80)
                        .overlay {
                            if selectedIDs.contains(item.id) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                            }
                        }
                        .onTapGesture {
                            if selectedIDs.contains(item.id) {
                                selectedIDs.removeAll { $0 == item.id }
                            } else {
                                selectedIDs.append(item.id)
                            }
                        }
//                        .draggable(containerItemID: item.id)
                        
                }
            }
            /*
             DragContainer requires the Item to conform to both Transferable and Identifiable protocols.
             */
            .dragContainer(for: String.self, selection: selectedIDs) { draggedItemID in
                return draggedItemID
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .overlay {
                    Text("Drop Area")
                }
                .dropDestination(for: String.self, isEnabled: true) { items, session in
                    print("### drop destination - items: \(items)")
                }
                /*
                 MARK: dropSessionUpdated
                 This updates us with information about the drop phase, drop location, and other relevant details. With this data, we can actually dynamically update the data!
                 */
                .onDropSessionUpdated { session in
                    print("### onDropSessionUpdated - session: \(session)")
                }
        }
    }
}

extension String: Identifiable {
    public var id: String {
        return self
    }
}

struct ColorItem: Identifiable {
    var id: String = UUID().uuidString
    var color: Color
}

let colorItems: [ColorItem] = [
    .init(color: .red),
    .init(color: .blue),
    .init(color: .green),
    .init(color: .yellow),
    .init(color: .purple),
    .init(color: .orange),
    .init(color: .pink),
    .init(color: .brown)
]

#Preview {
    Draggable()
}
