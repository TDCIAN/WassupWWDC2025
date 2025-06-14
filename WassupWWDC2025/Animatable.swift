//
//  Animatable.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/14/25.
//

import SwiftUI
/*
 MARK: 10. @Animatable
 As you can see, to animate this circle shape, we used to conform each and every property in the Shape to the animatable protocol. However, with this simple macro, the entire Shape will be animatble. But what if you don't need some properties to not have the animation?
 In those cases, we can use the @AnimatableIgnored macro for those properties!
 */
struct Animatable: View {
    
    @State private var expand: Bool = true
    
    var body: some View {
        VStack {
            CircleShape(radius: expand ? 100 : 0)
                .foregroundStyle(.green)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.smooth) {
                        expand.toggle()
                    }
                }
        }
        .padding()
    }
}

//@Animatable
struct CircleShape: Shape {
    @AnimatableIgnored var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path
                .addArc(
                    center: .init(x: rect.midX, y: rect.midY),
                    radius: radius,
                    startAngle: .zero,
                    endAngle: .init(degrees: 360),
                    clockwise: false
                )
        }
    }
}

#Preview {
    Animatable()
}
