//
//  NativeWebView.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/13/25.
//

import SwiftUI
import WebKit
/*
 MARK: 7. Native WebView
 SwiftUI now supports Native WebView with various in-built featues, including tracking scroll positions, updating scroll positions, and disabling certain gestures, etc,.
 */
struct NativeWebView: View {
    
    var url: URL {
        URL(string: "https://developer.apple.com")!
    }
    
    /*
     MARK: WebPage()
     You can also load pages by using WebPage as well, as this give more programmatic control over the web pages!
     */
    @State private var page = WebPage()
    
    var body: some View {
        WebView(page)
            .webViewMagnificationGestures(.disabled)
            .onAppear {
                page.load(URLRequest(url: url))
            }
    }
}

#Preview {
    NativeWebView()
}
