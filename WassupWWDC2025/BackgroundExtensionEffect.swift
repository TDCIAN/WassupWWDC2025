//
//  BackgroundExtensionEffect.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/13/25.
//

import SwiftUI

/*
 MARK: 5. backgroundExtensionEffect()
 This modifier extends the view to the available safe areas which subtle blur effects applied to them!
 */
struct BackgroundExtensionEffect: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            Image(.pic)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipped()
                .backgroundExtensionEffect()
        }
    }
}

#Preview {
    BackgroundExtensionEffect()
}
