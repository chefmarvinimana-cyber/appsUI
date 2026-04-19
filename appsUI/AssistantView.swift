//  AssistantView.swift
//  appsUI
//
//  Created by Mar Vin on 18/04/2026.
//

import SwiftUI

// A struct to represent a single message in the chat
struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isFromUser: Bool
}

struct AssistantView: View {
    @State private var userInput = ""
    @State private var messages: [ChatMessage] = [
        ChatMessage(text: "Hello! How can I help you today?", isFromUser: false)
    ]

    let theme: Theme

    var body: some View {
        ZStack {
            theme.backgroundColor.ignoresSafeArea()

            VStack {
                // Chat history view
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(messages) { message in
                            ChatBubble(message: message, theme: theme)
                        }
                    }
                    .padding()
                }

                // Input area
                HStack(spacing: 15) {
                    TextField("Ask something...", text: $userInput)
                        .padding(12)
                        .background(.ultraThinMaterial)
                        .foregroundColor(theme.primaryColor)
                        .cornerRadius(18)

                    Button(action: sendMessage) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(theme.accentColor)
                            .shadow(color: theme.accentColor, radius: 5)
                    }
                }
                .padding()
            }
        }
    }

    func sendMessage() {
        guard !userInput.isEmpty else { return }
        
        // Add user's message to the chat
        messages.append(ChatMessage(text: userInput, isFromUser: true))
        let userMessage = userInput
        userInput = ""

        // --- This is where the local AI would process the input ---
        // For now, we'll simulate a response after a short delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let aiResponse = "This is a simulated response to: \"\(userMessage)\""
            messages.append(ChatMessage(text: aiResponse, isFromUser: false))
        }
    }
}

// A view for the individual chat bubble
struct ChatBubble: View {
    let message: ChatMessage
    let theme: Theme

    var body: some View {
        Text(message.text)
            .padding()
            .foregroundColor(message.isFromUser ? .white : theme.primaryColor)
            .background(message.isFromUser ? AnyShapeStyle(theme.accentColor.opacity(0.8)) : AnyShapeStyle(.ultraThinMaterial))
            .cornerRadius(20)
            .frame(maxWidth: .infinity, alignment: message.isFromUser ? .trailing : .leading)
            .shadow(color: message.isFromUser ? theme.accentColor : .clear, radius: 4)
    }
}


#Preview {
    AssistantView(theme: Theme.neonDark)
}
