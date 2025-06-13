//
//  TabViewCustomizations.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/13/25.
//

import SwiftUI

/*
 MARK: 8. TabView Customizations
 
 By default, SwiftUI automatically adapts into this new iOS 26 glossy tab bar
 (if the app previously used the native tab bar and not the custom one).
 
 On iOS 26, the Search role tab item will be excluded and shown separately from the tab bar!
 */
struct TabViewCustomizations: View {
    var body: some View {
        TabView {
            Tab.init("Home", systemImage: "house.fill") {
                ScrollView(.vertical) {
                    Text("Home")
                        .containerRelativeFrame([.horizontal])
                        .containerRelativeFrame(.vertical) { value, _ in
                            value * 2
                        }
                }
            }
            
            Tab.init("Favorite", systemImage: "suit.heart.fill") {
                Text("Favorietes")
            }
            
            Tab.init("Settings", systemImage: "gearshape.fill") {
                Text("Settings")
            }
            
            Tab.init("Search", systemImage: "magnifyingglass", role: .search) {
                Text("Search")
            }
        }
        .tabViewBottomAccessory {
            Text("Custom Music Player!")
                .padding(.horizontal, 15)
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

#Preview {
    TabViewCustomizations()
}
