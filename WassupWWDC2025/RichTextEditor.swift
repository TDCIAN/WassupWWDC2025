//
//  RichTextEditor.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/13/25.
//

import SwiftUI

/*
 MARK: 6. Rich TextEditor
 TextEditor now supports AttributedString as a Binding, and the native TextEditor also has some useful rich text editor options!
 */
struct RichTextEditor: View {
    
    @State private var richText = AttributedString()
    
    var body: some View {
        TextEditor(text: $richText)
            .frame(height: 300)
            .padding(15)
            .border(Color.red, width: 1)
    }
}

#Preview {
    RichTextEditor()
}
