//
//  DrawSymbolEffects.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/14/25.
//

import SwiftUI

/*
 MARK: 11. drawOn & drawOff Symbol Effects
 iOS 26 has these two new symbol effects which will draw on/off by whole layer or symbol.
 You can visualize these effects on SFSymbols 7 Beta!
 */
struct DrawSymbolEffects: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        Image(systemName: "square.and.arrow.up")
            .font(.largeTitle)
            .foregroundStyle(.black)
//            .symbolEffect(.drawOff, value: isActive)
            .onTapGesture {
                isActive.toggle()
            }
        
    }
}

#Preview {
    DrawSymbolEffects()
}
