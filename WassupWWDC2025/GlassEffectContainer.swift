//
//  GlassEffectContainer.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/13/25.
//

import SwiftUI

/*
 MARK: 2. GlassEffectContainer(Used for Morphing & Grouping)
 SwiftUI offers a native container called GlassEffectContainer.
 With this container, we can effortlessly create morphing effects and group multiple views
 to achieve a single glass effect, etc,.
 */
struct GlassEffectContainer: View {
    
    @State private var isExpanded: Bool = false
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            /// Background Image
            Image(.pic)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipShape(.rect(cornerRadius: 20))
                .overlay(alignment: .bottom) {
                    SwiftUICore.GlassEffectContainer(spacing: 20) {
                        VStack(spacing: 20) {
                            Spacer()
                            
                            if isExpanded {
                                Group {
                                    Image(systemName: "suit.heart.fill")
                                        .font(.title)
                                        .foregroundStyle(.red.gradient)
                                        .frame(width: 50, height: 50)
                                    
                                    Image(systemName: "magnifyingglass")
                                        .font(.title)
                                        .foregroundStyle(.white.gradient)
                                        .frame(width: 50, height: 50)
                                }
//                                .glassEffect(.regular, in: .circle)
                                .glassEffect(.regular, in: .capsule)
                                /*
                                 MARK: glassEffectTransition()
                                 For instance, if you don't require animation when a specific setting is enabled in your app, such as the "Reduce Animations" toggle, you can utilize this modifier to eliminate morphing effects and animations!
                                 */
//                                .glassEffectTransition(.identity)
                                /*
                                 MARK: glassUnion()
                                 For instance, if you want to group two views to create a single glass effect without writing a separate H/VStack, you can utilize this modifier.
                                 This modifier will apply the single glass effect instead of each view having its own effect!
                                 */
                                .glassEffectUnion(id: "Group-1", namespace: animation)
                            }
                            
                            Button {
                                withAnimation(.smooth(duration: 1, extraBounce: 0)) {
                                    isExpanded.toggle()
                                }
                            } label: {
                                Image(systemName: "ellipsis")
                                    .font(.title)
                                    .foregroundStyle(.white.gradient)
                                    .frame(width: 40, height: 40)
                            }
                            .buttonStyle(.glass)
                        }
                    }
                    .padding(15)
                }
        }
    }
}

#Preview {
    GlassEffectContainer()
}
