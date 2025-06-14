//
//  ToolBarSpacer.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/13/25.
//

import SwiftUI
/*
 MARK: 9. ToolBarSpacer
 
 By default, all ToolBar Items are grouped together on iOS 26.
 However, there are may be instances where we need to separate a button from the group.
 This new modifier is particularly useful for separating ToolBar items or even creating multiple groups of ToolBar items.
 */
struct ToolBarSpacer: View {
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Todo's")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button("", systemImage: "suit.heart.fill") {
                            
                        }
                        
                        Button("", systemImage: "magnifyingglass") {
                            
                        }
                    }
                }
                
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "person.fill") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ToolBarSpacer()
}
