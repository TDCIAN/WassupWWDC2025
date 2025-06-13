//
//  FoundationModels.swift
//  WassupWWDC2025
//
//  Created by 김정민 on 6/13/25.
//

import SwiftUI
import FoundationModels

/*
 MARK: FoundationModels (SDK) (On-Device Intelligence)
 Xcode 26 now includes the FoundationModels SDK, enabling us to utilize the On-Device Intelligence models. Since these models are On-Device, they will function even when the device is offline.
 */
struct FoundationModels: View {
    
    @State private var prompt: String = ""
    @State private var answer: String = ""
    @State private var disableControls: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                Text(answer)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(15)
            }
            .safeAreaBar(edge: .bottom) {
                HStack(spacing: 10) {
                    TextField("Prompt", text: $prompt)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .glassEffect(.regular, in: .capsule)
                    
                    Button {
                        Task {
                            guard !prompt.isEmpty else { return }
                            
                            do {
                                let session = LanguageModelSession()
                                disableControls = true
                                
                                let response = session.streamResponse(to: prompt)
                                
                                for try await chunk in response {
                                    self.answer = chunk
                                }

                                disableControls = false
                            } catch {
                                disableControls = false
                                print("### FoundationModels error: \(error.localizedDescription)")
                            }
                        }
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .frame(width: 30, height: 30)
                    }
                    .buttonStyle(.glass)
                    
                }
                .disabled(disableControls)
                .padding(15)
            }
            .navigationTitle("Foundation Model")
        }
    }
}

#Preview {
    FoundationModels()
}
