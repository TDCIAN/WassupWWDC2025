//
//  LiquidGlassEffect.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/12/25.
//

import SwiftUI

/*
 MARK: 1. Liquid Glass Effect
 The new Liquid Glass Effect is used for almost all the system-wide apps, controls, and so on.
 Adopting it for our app is not a big task.
 Fortunately, SwiftUI supports the Liquid Glass Effect for both native controls and allows us to add these effects to custom views as well.
 */
struct LiquidGlassEffectView: View {
    var body: some View {
        ZStack {
            /// Background Image
            Image(.pic)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipShape(.rect(cornerRadius: 20))
            
            VStack(alignment: .center, spacing: 20) {
                Button("Tap Me") {
                    
                }
                .buttonStyle(.glass)
                
                Image(systemName: "suit.heart.fill")
                    .font(.title)
                    .foregroundStyle(.red.gradient)
                    .frame(width: 50, height: 50)
                    /// Can make any custom glass effect to be interactable!
                    /// Can adjust it's background tint as well!
//                    .glassEffect(.regular.interactive(), in: .circle)
                    .glassEffect(.regular.tint(.red.opacity(0.35)).interactive(), in: .circle)
            }
            
        }
    }
}

#Preview {
    LiquidGlassEffectView()
}
